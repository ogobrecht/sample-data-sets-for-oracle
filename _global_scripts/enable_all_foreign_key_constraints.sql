set define on verify off
prompt - enable all foreign key constraints for tables prefixed with "&1"
variable prefix varchar2(10)
begin
  :prefix := '&1';
end;
/
set define off

begin for i in (
--------------------------------------------------------------------------------
select
  table_name,
  constraint_name,
  status,
  'alter table ' || table_name || ' enable constraint ' || constraint_name as ddl
from
  user_constraints
where
  --without prefix we will find all user tables
  table_name like case when :prefix is not null then :prefix || '\_%' else '%' end escape '\'
  and constraint_type = 'R'
  and status = 'DISABLED'
--------------------------------------------------------------------------------
) loop
    execute immediate i.ddl;
  end loop;
end;
/
