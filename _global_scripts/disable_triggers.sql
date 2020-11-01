/*

Disable Triggers
================

For each table in the result set disable all triggers.

Options
-------

The first parameter of the script can contain two options:

- table_filter:
  - A like expression (escape char is '\')
  - Example: `table_filter=CO\_%` will be expanded to `table_name like 'CO\_%' escape '\'`
  - If omitted, it will default to '%' (matches all tables)
- dry_run:
  - `dry_run=true` will only report the intended work and do nothing
  - `dry_run=false` will do the intended work
  - If omitted, it will default to true

Examples
--------

    @disable_triggers.sql "table_filter=%  dry_run=true"
    @disable_triggers.sql "table_filter=CO\_%  dry_run=false"

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [disable_triggers.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-11-01

*/

prompt DISABLE TRIGGERS
set define on serveroutput on verify off feedback off linesize 120

declare
  v_table_filter   varchar2(100);
  v_dry_run        varchar2(100);
  v_count_tables   pls_integer := 0;
  v_count_triggers pls_integer := 0;
begin
  v_table_filter := nvl(regexp_substr('&1','table_filter=([^ ]*)',1,1,'i',1), '%');
  v_dry_run := nvl(lower(regexp_substr('&1','dry_run=(true|false)',1,1,'i',1)), 'true');
  if v_table_filter = '%' then
    dbms_output.put_line('- for all tables');
  else
    dbms_output.put_line('- for tables like ''' || v_table_filter || '''');
  end if;
  if v_dry_run = 'true' then
    dbms_output.put_line('- dry run entered');
  end if;
  for i in (
--------------------------------------------------------------------------------
select
  table_name,
  count(*) as number_triggers,
  'alter table ' || table_name || ' disable all triggers' as ddl
from
  user_triggers
where
  base_object_type = 'TABLE'
  and table_name like v_table_filter escape '\'
  and status = 'ENABLED'
group by
  table_name
--------------------------------------------------------------------------------
  ) loop
    dbms_output.put_line('- ' || i.ddl);
    if v_dry_run = 'false' then
      execute immediate i.ddl;
    end if;
    v_count_tables := v_count_tables + 1;
    v_count_triggers := v_count_triggers + i.number_triggers;
  end loop;

  dbms_output.put_line('- ' || v_count_triggers
    || ' trigger' || case when v_count_tables != 1 then 's' end
    || ' from ' || v_count_tables
    || ' table' || case when v_count_tables != 1 then 's' end || ' '
    || case when v_dry_run = 'false' then 'disabled' else 'reported' end);
end;
/
