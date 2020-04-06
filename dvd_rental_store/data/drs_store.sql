prompt - insert into drs_store 2 rows
set define off feedback off

begin
  insert into drs_store (store_id,manager_staff_id,address_id,last_update) values (1,1,1,to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_store (store_id,manager_staff_id,address_id,last_update) values (2,2,2,to_date('2020-04-06','yyyy-mm-dd'));
end;
/

commit;