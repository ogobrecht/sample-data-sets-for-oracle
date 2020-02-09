prompt - insert into hr_regions
set define off

begin
  insert into hr_regions (region_id,region_name) values (1,'Europe');
  insert into hr_regions (region_id,region_name) values (2,'Americas');
  insert into hr_regions (region_id,region_name) values (3,'Asia');
  insert into hr_regions (region_id,region_name) values (4,'Middle East and Africa');
end;
/
