/*

Sync Sequence Values To Data
============================

Set sequence values to the current max data values. This is done for implicit
sequences (identity columns) and explicit sequences (used as column default
value or in a trigger).

Options
-------

The first parameter of the script can contain a JSON object with two keys:

- table_filter:
  - A like expression (escape char is '\')
  - Example: 'CO\_%' will be expanded to table_name like 'CO\_%' escape '\'
  - If omitted, it will default to '%' (matches all tables)
- dry_run:
  - If true, the script will only report the intended work and do nothing
  - If false, the script will do the intended work
  - If omitted, it will default to true

Examples
--------

    @sync_sequence_values_to_data.sql "{ table_filter: '%',     dry_run: false }"
    @sync_sequence_values_to_data.sql "{ table_filter: 'CO\_%', dry_run: true  }"

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [sync_sequence_values_to_data.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-10-29
- Inspiration: https://stackoverflow.com/questions/51470/how-do-i-reset-a-sequence-in-oracle

*/

prompt SYNC SEQUENCE VALUES TO DATA
set define on serveroutput on verify off feedback off linesize 120
variable options       varchar2(4000)
variable table_filter  varchar2(100)
variable dry_run       varchar2(100)

declare
  v_ddl        varchar2(4000);
  v_nextval    pls_integer;
  v_dataval    pls_integer;
  v_difference pls_integer;
  v_count_skipped  pls_integer := 0;
  v_count_identity pls_integer := 0;
  v_count_default  pls_integer := 0;
  v_count_trigger  pls_integer := 0;
begin
  :options      := q'[&1]';
  :table_filter := nvl(json_value(:options, '$.table_filter'), '%');
  :dry_run      := nvl(json_value(:options, '$.dry_run'), 'true');
  if :table_filter = '%' then
    dbms_output.put_line('- for all tables');
  else
    dbms_output.put_line('- for tables like ''' || :table_filter || '''');
  end if;
  if :dry_run = 'true' then
    dbms_output.put_line('- dry run entered');
  end if;
  for i in (
--------------------------------------------------------------------------------
with
identity_columns as (
  select
    table_name,
    column_name,
    sequence_name,
    'IDENTITY_COLUMN' as source_type,
    generation_type
  from
    user_tab_identity_cols
) --select * from identity_columns order by table_name;
,
column_data_defaults as (
  -- working with long columns: http://www.oracle-developer.net/display.php?id=430
  select
    x.table_name,
    x.column_name,
    regexp_substr(x.data_default,'"?([^". ]+)"?."?nextval"?',1,1,'i',1) as sequence_name,
    'COLUMN_DATA_DEFAULT' as source_type,
    null as generation_type
  from
    xmltable('/ROWSET/ROW'
      passing (
        select
          dbms_xmlgen.getxmltype('select * from user_tab_columns where data_default is not null')
        from
          dual)
      columns
        table_name      varchar2(128 char)  path 'TABLE_NAME',
        column_name     varchar2(128 char)  path 'COLUMN_NAME',
        data_default    varchar2(4000 char) path 'DATA_DEFAULT') x
  where
    data_default not like '%ISEQ$$%'
    and regexp_like(data_default,'.nextval','i')
) --select * from column_data_defaults;
,
triggers_base as (
  select
    trigger_name,
    table_name
  from
    user_triggers
  where
    trigger_type = 'BEFORE EACH ROW'
    and triggering_event = 'INSERT'
) --select * from triggers_base;
,
triggers_column_code as (
  select
    name,
    text as code_line_column
  from
    user_source
  where
    type = 'TRIGGER'
    and name in (select trigger_name from triggers_base)
    and regexp_like(text,'new\..*\s+is\s+null','i')
) --select * from triggers_column_code;
,
triggers_sequence_code as (
  select
    name,
    text as code_line_sequence
  from
    user_source
  where
    type = 'TRIGGER'
    and name in (select trigger_name from triggers_base)
    and regexp_like(text,'.nextval','i')
) --select * from triggers_sequence_code;
,
triggers_all_code as (
  select
    trigger_name,
    table_name,
    code_line_column,
    upper(regexp_substr(code_line_column,'new\.(.*)\s+is\s+null',1,1,'i',1)) as column_name,
    code_line_sequence,
    upper(regexp_substr(code_line_sequence,'"?([^". ]+)"?."?nextval"?',1,1,'i',1)) as sequence_name
  from
    triggers_base
    left join triggers_column_code   on trigger_name = triggers_column_code.name
    left join triggers_sequence_code on trigger_name = triggers_sequence_code.name
) --select * from triggers_all_code;
,
triggers_ as (
  select
    table_name,
    column_name,
    sequence_name,
    'TRIGGER_SOURCE' as source_type,
    null as generation_type
  from
    triggers_all_code
  where
    column_name       is not null
    and sequence_name is not null
) --select * from triggers_;
select
  table_name,
  column_name,
  sequence_name,
  source_type,
  generation_type,
  default_on_null,
  increment_by,
  min_value,
  max_value
from
  ( select * from identity_columns     union all
    select * from column_data_defaults union all
    select * from triggers_ )
  natural join user_tab_cols
  natural join user_sequences
where
  table_name like :table_filter escape '\'
--------------------------------------------------------------------------------
  ) loop
    dbms_output.put_line('- tab:' || i.table_name || ' col:' || i.column_name
      || ' seq:' || i.sequence_name || ' typ:' || i.source_type);
    if :dry_run = 'true' then
      case i.source_type
        when 'IDENTITY_COLUMN'     then v_count_identity := v_count_identity + 1;
        when 'COLUMN_DATA_DEFAULT' then v_count_default  := v_count_default  + 1;
        when 'TRIGGER_SOURCE'      then v_count_trigger  := v_count_trigger  + 1;
      end case;
    else
      execute immediate
        'select max(' || i.column_name || ') from ' || i.table_name into v_dataval;
      if v_dataval is null then
        v_count_skipped := v_count_skipped + 1;
      else
        if i.source_type = 'IDENTITY_COLUMN' then
          execute immediate 'alter table ' || i.table_name || ' modify '
            || i.column_name || ' generated ' || i.generation_type
            || case when i.default_on_null = 'YES' then ' on null' end
            || ' as identity (start with limit value)';
          v_count_identity := v_count_identity + 1;
        else
          execute immediate
            'select ' || i.sequence_name || '.nextval from dual' INTO v_nextval;
          v_difference := greatest(v_dataval, i.min_value) - v_nextval;
          if v_difference != 0 then
            begin
                execute immediate
                  'alter sequence ' || i.sequence_name || ' increment by ' || v_difference;
                execute immediate
                  'select ' || i.sequence_name || '.nextval from dual' INTO v_nextval;
                execute immediate
                  'alter sequence ' || i.sequence_name || ' increment by ' || i.increment_by;
                case i.source_type
                  when 'COLUMN_DATA_DEFAULT' then
                    v_count_default := v_count_default + 1;
                  when 'TRIGGER_SOURCE' then
                    v_count_trigger := v_count_trigger + 1;
                end case;
            exception
              when others then
                -- reset increment by to original value
                execute immediate
                  'alter sequence ' || i.sequence_name || ' increment by ' || i.increment_by;
                raise;
            end;
          end if;
        end if;
      end if;
    end if;
  end loop;
  if v_count_skipped != 0 then
    dbms_output.put_line('- ' || v_count_skipped
      || ' sequence' || case when v_count_skipped != 1 then 's' end
      || ' skipped (no data in table)');
  end if;
  if v_count_identity != 0 then
    dbms_output.put_line('- ' || v_count_identity
      || ' implicit sequence' || case when v_count_identity != 1 then 's' end
      || ' (from identity columns) '
      || case when :dry_run = 'false' then 'synced to data' else 'reported' end);
  end if;
  if v_count_default != 0 then
    dbms_output.put_line('- ' || v_count_default
      || ' explicit sequence' || case when v_count_default != 1 then 's' end
      || ' (from column data defaults) '
      || case when :dry_run = 'false' then 'synced to data' else 'reported' end);

  end if;
  if v_count_trigger != 0 then
    dbms_output.put_line('- ' || v_count_trigger
      || ' explicit sequence' || case when v_count_trigger != 1 then 's' end
      || ' (from trigger sources) '
      || case when :dry_run = 'false' then 'synced to data' else 'reported' end);
  end if;
end;
/
