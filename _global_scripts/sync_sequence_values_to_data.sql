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
  v_count pls_integer := 0;
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
column_data_defaults as (
  -- working with long columns: http://www.oracle-developer.net/display.php?id=430
  select
    x.table_name,
    x.column_name,
    x.data_default, -- type long :-(
    regexp_substr(x.data_default,'"?([^". ]+)"?."?nextval"?',1,1,'i',1) as sequence_name
  from
    xmltable('/ROWSET/ROW'
      passing (
        select
          dbms_xmlgen.getxmltype('select * from user_tab_columns where data_default is not null')
        from
          dual)
      columns
        table_name   varchar2(128)  path 'TABLE_NAME',
        column_name  varchar2(128)  path 'COLUMN_NAME',
        data_default varchar2(4000) path 'DATA_DEFAULT') x
  where
    regexp_like(data_default,'.nextval','i')
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
columns_base as (
  select
    name,
    text as code_line_column
  from
    user_source
  where
    type = 'TRIGGER'
    and name in (select trigger_name from triggers_base)
    and regexp_like(text,'new\..*id\s+is\s+null','i')
)--select * from columns_base;
,---------------------------------------
sequences_base as (
  select
    name,
    text as code_line_sequence
  from
    user_source
  where
    type = 'TRIGGER'
    and name in (select trigger_name from triggers_base)
    and regexp_like(text,'.nextval','i')
)--select * from sequences_base;
,---------------------------------------
trigger_sources as (
select
  trigger_name,
  table_name,
  code_line_column,
  regexp_substr(code_line_column,'new\.(.*id)\s+is\s+null',1,1,'i',1) as column_name,
  code_line_sequence,
  regexp_substr(code_line_sequence,'"?([^". ]+)"?."?nextval"?',1,1,'i',1) as sequence_name
from
  triggers_base
  left join columns_base   on trigger_name = columns_base.name
  left join sequences_base on trigger_name = sequences_base.name
)
----------------------------------------
select
  table_name,
  column_name,
  sequence_name
from
  column_data_defaults
union all
select
  table_name,
  column_name,
  sequence_name
from trigger_sources
where
  column_name       is not null
  and sequence_name is not null
--------------------------------------------------------------------------------
  ) loop
    --FIXME: implement logik
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('- ' || v_count || ' sequences values synced to data');
end;
/