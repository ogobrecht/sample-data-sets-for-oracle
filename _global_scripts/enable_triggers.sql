/*

Enable Triggers
---------------

For each table in the result set enable all triggers.

OPTIONS

The first parameter of the script can contain two options:

- table_prefix:
  - Given value will be uppercased, a right underscore be trimmed because we need to inject a backslash
  - Example: `table_prefix=hr` will result in a filter expression `table_name like 'HR\_%' escape '\'`
  - If omitted, it will default to NULL and match then all tables
- dry_run:
  - `dry_run=true` will only report the intended work and do nothing
  - `dry_run=false` will do the intended work
  - If omitted, it will default to true

EXAMPLES

    @enable_triggers.sql "dry_run=true"
    @enable_triggers.sql "table_prefix=co  dry_run=false"

META

- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [enable_triggers.sql …](https://github.com/ogobrecht/oracle-sql-scripts/)
- Last Update: 2020-12-31

*/

prompt ENABLE TRIGGERS
set define on serveroutput on verify off feedback off linesize 120

declare
  v_table_prefix   varchar2(100);
  v_table_filter varchar2(100);
  v_dry_run        varchar2(100);
  v_count_tables   pls_integer := 0;
  v_count_triggers pls_integer := 0;
begin
  v_table_prefix := rtrim(upper(regexp_substr('&1','table_prefix=([^ ]*)',1,1,'i',1)),'_');
  v_dry_run      := nvl(lower(regexp_substr('&1','dry_run=(true|false)',1,1,'i',1)), 'true');
  if v_table_prefix is null then
    dbms_output.put_line('- for all tables');
    v_table_filter := '%';
  else
    dbms_output.put_line('- for tables prefixed with ''' || v_table_prefix || '''');
    v_table_filter := v_table_prefix || '\_%';
  end if;
  if v_dry_run = 'true' then
    dbms_output.put_line('- dry run entered');
  end if;
  for i in (
--------------------------------------------------------------------------------
select
  table_name,
  count(*) as number_triggers,
  'alter table ' || table_name || ' enable all triggers' as ddl
from
  user_triggers
where
  base_object_type = 'TABLE'
  and table_name like v_table_filter escape '\'
  and status = 'DISABLED'
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
    || case when v_dry_run = 'false' then 'enabled' else 'reported' end);
end;
/
