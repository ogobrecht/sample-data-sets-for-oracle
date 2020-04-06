prompt - insert into drs_category 16 rows
set define off feedback off

begin
  insert into drs_category (category_id,name,last_update) values (1,'Action',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (2,'Animation',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (3,'Children',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (4,'Classics',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (5,'Comedy',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (6,'Documentary',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (7,'Drama',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (8,'Family',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (9,'Foreign',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (10,'Games',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (11,'Horror',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (12,'Music',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (13,'New',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (14,'Sci-Fi',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (15,'Sports',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_category (category_id,name,last_update) values (16,'Travel',to_date('2020-04-06','yyyy-mm-dd'));
end;
/

commit;