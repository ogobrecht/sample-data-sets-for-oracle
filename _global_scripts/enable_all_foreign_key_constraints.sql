set define on verify off
prompt - enable all foreign key constraints for tables prefixed with "&1"
variable prefix varchar2(10)
begin
  :prefix := '&1';
end;
/
set define off

begin for i in (
------------------------------------------------------------
select
  table_name,
  constraint_name,
  status
from
  user_constraints
where
  table_name like upper(:prefix) || '\_%' escape '\'
  and constraint_type = 'R'
  and status = 'DISABLED'
------------------------------------------------------------
) loop
    execute immediate
      replace(replace('alter table #TABLE_NAME# enable constraint #CONSTRAINT_NAME#',
                      '#TABLE_NAME#',
                      i.table_name),
              '#CONSTRAINT_NAME#',
              i.constraint_name);
  end loop;
end;
/
