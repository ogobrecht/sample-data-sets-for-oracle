/*

Enable Triggers
===============

For each table in the result set enable all triggers.

Options
-------

The first parameter of the script can contain a JSON object with two keys:

- table_prefix:
  - If null: Takes all tables of current schema into account
  - If not null: Use the given prefix to filter tables
  - Example: "CO" will be expanded to `table_name like 'CO\_%' escape '\'`
- dry_run:
  - If true, the script will do the intended work
  - If false, the script will only report the intended work and do nothing
  - If omitted, it will default to false

Usage
-----
- `@enable_triggers.sql '{ table_prefix: "",     dry_run: false }'` (all tables, do the intended work)
- `@enable_triggers.sql '{ table_prefix: "",     dry_run: true  }'` (all tables, report only)
- `@enable_triggers.sql '{ table_prefix: "OEHR", dry_run: false }'` (only for tables prefixed with "OEHR")
- `@enable_triggers.sql '{ table_prefix: "CO",   dry_run: true  }'` (only for tables prefixed with "CO", report only)

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [enable_triggers.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-10-31

*/

prompt ENABLE TRIGGERS
set define on serveroutput on verify off feedback off
variable options       varchar2(4000)
variable table_prefix  varchar2(100)
variable dry_run       varchar2(100)

declare
  v_count_tables   pls_integer := 0;
  v_count_triggers pls_integer := 0;
begin
  :options      := '&1';
  :table_prefix := json_value(:options, '$.table_prefix');
  :dry_run      := nvl(json_value(:options, '$.dry_run'), 'false');
  if :table_prefix is not null then
    dbms_output.put_line('- for tables prefixed with "' || :table_prefix || '_"');
  else
    dbms_output.put_line('- for all tables');
  end if;
  if :dry_run = 'true' then
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
  and table_name like case when :table_prefix is not null then :table_prefix || '\_%' else '%' end escape '\'
  and status = 'DISABLED'
group by
  table_name
--------------------------------------------------------------------------------
  ) loop
    dbms_output.put_line('- ' || i.ddl);
    if :dry_run = 'false' then
      execute immediate i.ddl;
    end if;
    v_count_tables := v_count_tables + 1;
    v_count_triggers := v_count_triggers + i.number_triggers;
  end loop;

  dbms_output.put_line('- ' || v_count_triggers || ' triggers from ' || v_count_tables
    || ' table' || case when v_count_tables != 1 then 's' end || ' '
    || case when :dry_run = 'false' then 'enabled' else 'reported' end);
end;
/
