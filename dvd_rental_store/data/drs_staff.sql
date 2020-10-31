prompt - insert     2 rows into drs_staff
set define off feedback off

begin
  insert into drs_staff (staff_id,first_name,last_name,address_id,picture,email,store_id,active,username,password,last_update) values (1,'Mike','Hillyer',3, empty_blob(),'Mike.Hillyer@sakilastaff.com',1,1,'Mike','8cb2237d0679ca88db6464eac60da96345513964',current_date);
  insert into drs_staff (staff_id,first_name,last_name,address_id,picture,email,store_id,active,username,password,last_update) values (2,'Jon','Stephens',4, empty_blob(),'Jon.Stephens@sakilastaff.com',2,1,'Jon','8cb2237d0679ca88db6464eac60da96345513964',current_date);
end;
/

commit;