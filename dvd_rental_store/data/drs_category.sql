prompt - insert    16 rows into drs_category
set define off feedback off

begin
  insert into drs_category (category_id,name,last_update) values (1,'Action',current_date);
  insert into drs_category (category_id,name,last_update) values (2,'Animation',current_date);
  insert into drs_category (category_id,name,last_update) values (3,'Children',current_date);
  insert into drs_category (category_id,name,last_update) values (4,'Classics',current_date);
  insert into drs_category (category_id,name,last_update) values (5,'Comedy',current_date);
  insert into drs_category (category_id,name,last_update) values (6,'Documentary',current_date);
  insert into drs_category (category_id,name,last_update) values (7,'Drama',current_date);
  insert into drs_category (category_id,name,last_update) values (8,'Family',current_date);
  insert into drs_category (category_id,name,last_update) values (9,'Foreign',current_date);
  insert into drs_category (category_id,name,last_update) values (10,'Games',current_date);
  insert into drs_category (category_id,name,last_update) values (11,'Horror',current_date);
  insert into drs_category (category_id,name,last_update) values (12,'Music',current_date);
  insert into drs_category (category_id,name,last_update) values (13,'New',current_date);
  insert into drs_category (category_id,name,last_update) values (14,'Sci-Fi',current_date);
  insert into drs_category (category_id,name,last_update) values (15,'Sports',current_date);
  insert into drs_category (category_id,name,last_update) values (16,'Travel',current_date);
end;
/

commit;