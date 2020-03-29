/*******************************************************************************

Sync Sequence Values To Data
============================

Set sequence values to the current max data values. This is done for implicit
sequences (identity columns) and explicit sequences (used as column default
value or in a trigger).

Usage
-----
- `@sync_sequence_values_to_data.sql ""` (for all tables)
- `@sync_sequence_values_to_data.sql "OEHR"` (only for tables prefixed with "OEHR")

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [sync_sequence_values_to_data.sql](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/sync_sequence_values_to_data.sql)
- Inspiration: https://stackoverflow.com/questions/51470/how-do-i-reset-a-sequence-in-oracle
- Last Update: 2020-03-25

*******************************************************************************/

set define on serveroutput on verify off feedback off
prompt RESET IDENTITY COLUMNS
declare
  v_prefix varchar2(100);
  v_count_identity_column pls_integer := 0;
  v_count_column_data_default pls_integer := 0;
  v_count_trigger_source pls_integer := 0;
begin
  v_prefix := '&1';
  if v_prefix is not null then
    dbms_output.put_line('- for tables prefixed with "' || v_prefix || '"');
  else
    dbms_output.put_line('- for all tables');
  end if;
  for i in (
--------------------------------------------------------------------------------
with
identity_columns as (
  select
    i.table_name,
    i.column_name,
    i.sequence_name,
    'IDENTITY_COLUMN' as source,
    i.generation_type,
    t.default_on_null
  from
    user_tab_identity_cols i
    join user_tab_cols t
      on i.table_name = t.table_name
      and i.column_name = t.column_name
)--select * from identity_columns;
,---------------------------------------
column_data_defaults as (
  -- working with long columns: http://www.oracle-developer.net/display.php?id=430
  select
    x.table_name,
    x.column_name,
    regexp_substr(x.data_default,'"?([^". ]+)"?."?nextval"?',1,1,'i',1) as sequence_name,
    'COLUMN_DATA_DEFAULT' as source,
    null as generation_type,
    x.default_on_null
  from
    xmltable('/ROWSET/ROW'
      passing (
        select
          dbms_xmlgen.getxmltype('select * from user_tab_columns where data_default is not null')
        from
          dual)
      columns
        table_name      varchar2(128)  path 'TABLE_NAME',
        column_name     varchar2(128)  path 'COLUMN_NAME',
        data_default    varchar2(4000) path 'DATA_DEFAULT',
        default_on_null varchar2(10)   path 'DEFAULT_ON_NULL') x
  where
    data_default not like '%ISEQ$$%'
    and regexp_like(data_default,'.nextval','i')
)--select * from column_data_defaults;
,---------------------------------------
triggers_base as (
  select
    trigger_name,
    table_name
  from
    user_triggers
  where
    trigger_type = 'BEFORE EACH ROW'
    and triggering_event = 'INSERT'
)--select * from triggers_base;
,---------------------------------------
trigger_columns as (
  select
    name,
    text as code_line_column
  from
    user_source
  where
    type = 'TRIGGER'
    and name in (select trigger_name from triggers_base)
    and regexp_like(text,'new\..*\s+is\s+null','i')
)--select * from trigger_columns;
,---------------------------------------
trigger_sequences as (
  select
    name,
    text as code_line_sequence
  from
    user_source
  where
    type = 'TRIGGER'
    and name in (select trigger_name from triggers_base)
    and regexp_like(text,'.nextval','i')
)--select * from trigger_sequences;
,---------------------------------------
trigger_sources_base as (
  select
    trigger_name,
    table_name,
    code_line_column,
    regexp_substr(code_line_column,'new\.(.*)\s+is\s+null',1,1,'i',1) as column_name,
    code_line_sequence,
    regexp_substr(code_line_sequence,'"?([^". ]+)"?."?nextval"?',1,1,'i',1) as sequence_name
  from
    triggers_base
    left join trigger_columns   on trigger_name = trigger_columns.name
    left join trigger_sequences on trigger_name = trigger_sequences.name
)--select * from trigger_sources_base;
,---------------------------------------
trigger_sources as (
  select
    table_name,
    column_name,
    sequence_name,
    'TRIGGER_SOURCE' as source,
    null as generation_type,
    null as default_on_null
  from
    trigger_sources_base
  where
    column_name       is not null
    and sequence_name is not null
)--select * from trigger_sources;
----------------------------------------
select * from identity_columns     union all
select * from column_data_defaults union all
select * from trigger_sources
--------------------------------------------------------------------------------
  ) loop
    if i.source = 'IDENTITY_COLUMN' then
      execute immediate ('alter table ' || i.table_name || ' modify '
        || i.column_name || ' generated ' || i.generation_type
        || case when i.default_on_null = 'YES' then ' on null' end
        || ' as identity (start with limit value)');
      v_count_identity_column := v_count_identity_column + 1;
    else
      --logic here
      case i.source
        when 'COLUMN_DATA_DEFAULT' then
          v_count_column_data_default := v_count_column_data_default + 1;
        when 'TRIGGER_SOURCE' then
          v_count_trigger_source := v_count_trigger_source + 1;
      end case;
    end if;
  end loop;
  dbms_output.put_line('- ' || v_count_identity_column
    || ' implicit sequence' || case when v_count_identity_column != 1 then 's' end
    || ' (from identity columns) synced to data');
  dbms_output.put_line('- FIXME: ' || v_count_column_data_default
    || ' implicit sequence' || case when v_count_column_data_default != 1 then 's' end
    || ' (from column data defaults) synced to data');
  dbms_output.put_line('- FIXME: ' || v_count_trigger_source
    || ' implicit sequence' || case when v_count_trigger_source != 1 then 's' end
    || ' (from trigger sources) synced to data');
end;
/