/*

Disable Foreign Key Constraints
===============================

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
- `@disable_foreign_key_constraints.sql '{ table_prefix: "",     dry_run: false }'` (all tables, do the intended work)
- `@disable_foreign_key_constraints.sql '{ table_prefix: "",     dry_run: true  }'` (all tables, report only)
- `@disable_foreign_key_constraints.sql '{ table_prefix: "OEHR", dry_run: false }'` (only for tables prefixed with "OEHR")
- `@disable_foreign_key_constraints.sql '{ table_prefix: "CO",   dry_run: true  }'` (only for tables prefixed with "CO", report only)

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [disable_all_foreign_key_constraints.sql …](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/scripts/)
- Last Update: 2020-10-31

*/

prompt DISABLE FOREIGN KEY CONSTRAINTS
set define on serveroutput on verify off feedback off
variable options       varchar2(4000)
variable table_prefix  varchar2(100)
variable dry_run       varchar2(100)

declare
  v_count pls_integer := 0;
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
  constraint_name,
  status,
  'alter table ' || table_name || ' disable constraint ' || constraint_name as ddl
from
  user_constraints
where
  table_name like case when :table_prefix is not null then :table_prefix || '\_%' else '%' end escape '\'
  and table_name not like 'BIN$%'
  and constraint_type = 'R'
  and status = 'ENABLED'
--------------------------------------------------------------------------------
  ) loop
    dbms_output.put_line('- ' || i.ddl);
    if :dry_run = 'false' then
      execute immediate i.ddl;
    end if;
    v_count := v_count + 1;
  end loop;

  dbms_output.put_line('- ' || v_count || ' foreign key'
    || case when v_count != 1 then 's' end || ' '
    || case when :dry_run = 'false' then 'disabled' else 'reported' end);
end;
/
