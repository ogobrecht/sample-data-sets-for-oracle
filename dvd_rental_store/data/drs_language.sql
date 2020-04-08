prompt - insert     6 rows into drs_language
set define off feedback off

begin
  insert into drs_language (language_id,name,last_update) values (1,'English',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_language (language_id,name,last_update) values (2,'Italian',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_language (language_id,name,last_update) values (3,'Japanese',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_language (language_id,name,last_update) values (4,'Mandarin',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_language (language_id,name,last_update) values (5,'French',to_date('2020-04-06','yyyy-mm-dd'));
  insert into drs_language (language_id,name,last_update) values (6,'German',to_date('2020-04-06','yyyy-mm-dd'));
end;
/

commit;