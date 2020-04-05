prompt - insert into oehr_job_history
set define off

begin
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (200,to_date('2007-04-02','yyyy-mm-dd'),to_date('2012-12-31','yyyy-mm-dd'),'AD_ASST',90);
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (101,to_date('2009-04-06','yyyy-mm-dd'),to_date('2013-05-12','yyyy-mm-dd'),'AC_ACCOUNT',110);
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (101,to_date('2013-05-13','yyyy-mm-dd'),to_date('2016-09-28','yyyy-mm-dd'),'AC_MGR',110);
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (102,to_date('2012-07-29','yyyy-mm-dd'),to_date('2018-02-06','yyyy-mm-dd'),'IT_PROG',60);
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (200,to_date('2014-01-14','yyyy-mm-dd'),to_date('2018-07-16','yyyy-mm-dd'),'AC_ACCOUNT',90);
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (176,to_date('2017-10-07','yyyy-mm-dd'),to_date('2018-07-16','yyyy-mm-dd'),'SA_REP',80);
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (201,to_date('2015-09-02','yyyy-mm-dd'),to_date('2019-07-04','yyyy-mm-dd'),'MK_REP',20);
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (114,to_date('2017-10-07','yyyy-mm-dd'),to_date('2019-07-16','yyyy-mm-dd'),'ST_CLERK',50);
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (176,to_date('2018-07-17','yyyy-mm-dd'),to_date('2019-07-16','yyyy-mm-dd'),'SA_MAN',80);
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values (122,to_date('2018-07-17','yyyy-mm-dd'),to_date('2019-07-16','yyyy-mm-dd'),'ST_CLERK',50);
end;
/

commit;
