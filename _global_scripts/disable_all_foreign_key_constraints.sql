/*******************************************************************************

Disable All Foreign Key Constraints
===================================

Usage
-----
- `@disable_all_foreign_key_constraints.sql ""` (for all tables)
- `@disable_all_foreign_key_constraints.sql "OEHR"` (only for tables prefixed with "OEHR")

Meta
----
- Author: [Ottmar Gobrecht](https://ogobrecht.github.io)
- Script: [disable_all_foreign_key_constraints.sql](https://github.com/ogobrecht/oracle-sql-scripts/blob/master/disable_all_foreign_key_constraints.sql)
- Last Update: 2020-03-25

*******************************************************************************/

set define on serveroutput on verify off feedback off
prompt DISABLE ALL FOREIGN KEY CONSTRAINTS
declare
  v_prefix varchar2(100 char);
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
select
  table_name,
  constraint_name,
  status,
  'alter table ' || table_name || ' disable constraint ' || constraint_name as ddl
from
  user_constraints
where
  table_name like case when v_prefix is not null then v_prefix || '\_%' else '%' end escape '\'
  and table_name not like 'BIN$%'
  and constraint_type = 'R'
  and status = 'ENABLED'
--------------------------------------------------------------------------------
  ) loop
    execute immediate i.ddl;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('- ' || v_count || ' foreign keys disabled');
end;
/
