prompt - insert into hr_job_history
set define off

begin
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (102,to_date('13-01-2001','dd-mm-yyyy'),to_date('24-07-2006','dd-mm-yyyy'),'IT_PROG',60);
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (101,to_date('21-09-1997','dd-mm-yyyy'),to_date('27-10-2001','dd-mm-yyyy'),'AC_ACCOUNT',110);
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (101,to_date('28-10-2001','dd-mm-yyyy'),to_date('15-03-2005','dd-mm-yyyy'),'AC_MGR',110);
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (201,to_date('17-02-2004','dd-mm-yyyy'),to_date('19-12-2007','dd-mm-yyyy'),'MK_REP',20);
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (114,to_date('24-03-2006','dd-mm-yyyy'),to_date('31-12-2007','dd-mm-yyyy'),'ST_CLERK',50 );
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (122,to_date('01-01-2007','dd-mm-yyyy'),to_date('31-12-2007','dd-mm-yyyy'),'ST_CLERK',50 );
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (200,to_date('17-09-1995','dd-mm-yyyy'),to_date('17-06-2001','dd-mm-yyyy'),'AD_ASST',90 );
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (176,to_date('24-03-2006','dd-mm-yyyy'),to_date('31-12-2006','dd-mm-yyyy'),'SA_REP',80 );
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (176,to_date('01-01-2007','dd-mm-yyyy'),to_date('31-12-2007','dd-mm-yyyy'),'SA_MAN',80 );
  insert into hr_job_history (employee_id,start_date,end_date,job_id,department_id) values (200,to_date('01-07-2002','dd-mm-yyyy'),to_date('31-12-2006','dd-mm-yyyy'),'AC_ACCOUNT',90 );
end;


/
