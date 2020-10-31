prompt - insert     2 rows into drs_store
set define off feedback off

begin
  insert into drs_store (store_id,manager_staff_id,address_id,last_update) values (1,1,1,current_date);
  insert into drs_store (store_id,manager_staff_id,address_id,last_update) values (2,2,2,current_date);
end;
/

commit;