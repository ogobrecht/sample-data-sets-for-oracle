prompt - insert     6 rows into drs_language
set define off feedback off

begin
  insert into drs_language (language_id,name,last_update) values (1,'English',current_date);
  insert into drs_language (language_id,name,last_update) values (2,'Italian',current_date);
  insert into drs_language (language_id,name,last_update) values (3,'Japanese',current_date);
  insert into drs_language (language_id,name,last_update) values (4,'Mandarin',current_date);
  insert into drs_language (language_id,name,last_update) values (5,'French',current_date);
  insert into drs_language (language_id,name,last_update) values (6,'German',current_date);
end;
/

commit;