prompt - insert into oehr_job_history
set define off

begin
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('102',to_date('25.07.12','DD.MM.RR'),to_date('02.02.18','DD.MM.RR'),'IT_PROG','60');
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('101',to_date('02.04.09','DD.MM.RR'),to_date('08.05.13','DD.MM.RR'),'AC_ACCOUNT','110');
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('101',to_date('09.05.13','DD.MM.RR'),to_date('24.09.16','DD.MM.RR'),'AC_MGR','110');
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('201',to_date('29.08.15','DD.MM.RR'),to_date('30.06.19','DD.MM.RR'),'MK_REP','20');
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('114',to_date('03.10.17','DD.MM.RR'),to_date('12.07.19','DD.MM.RR'),'ST_CLERK','50');
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('122',to_date('13.07.18','DD.MM.RR'),to_date('12.07.19','DD.MM.RR'),'ST_CLERK','50');
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('200',to_date('29.03.07','DD.MM.RR'),to_date('27.12.12','DD.MM.RR'),'AD_ASST','90');
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('176',to_date('03.10.17','DD.MM.RR'),to_date('12.07.18','DD.MM.RR'),'SA_REP','80');
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('176',to_date('13.07.18','DD.MM.RR'),to_date('12.07.19','DD.MM.RR'),'SA_MAN','80');
insert into oehr_job_history (employee_id,start_date,end_date,job_id,department_id) values ('200',to_date('10.01.14','DD.MM.RR'),to_date('12.07.18','DD.MM.RR'),'AC_ACCOUNT','90');
end;
/
