prompt - table oehr_jobs

create table oehr_jobs (
  job_id     varchar2(10 char) ,
  job_title  varchar2(35 char) not null,
  min_salary number(6)    ,
  max_salary number(6)    ,
  --
  primary key (job_id)
);

comment on table oehr_jobs is
  'jobs table with job titles and salary ranges. Contains 19 rows. References with employees and job_history table.';

comment on column oehr_jobs.job_id is
  'Primary key of jobs table.';

comment on column oehr_jobs.job_title is
  'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT.';

comment on column oehr_jobs.min_salary is
  'Minimum salary for a job title.';

comment on column oehr_jobs.max_salary is
  'Maximum salary for a job title.';
