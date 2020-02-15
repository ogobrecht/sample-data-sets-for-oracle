prompt - table oehr_job_history

create table oehr_job_history (
  employee_id   integer      not null,
  start_date    date         not null,
  end_date      date         not null,
  job_id        varchar2(10) not null,
  department_id integer      ,
  --
  primary key (employee_id, start_date),
  check       (end_date >= start_date)
);

comment on table oehr_job_history is
  'Table that stores job history of the employees. If an employee changes departments within the job or changes jobs within the department, new rows get inserted into this table with old job information of the employee. Contains a complex primary key: employee_id+start_date. Contains 25 rows. References with jobs, employees, and departments tables.';

comment on column oehr_job_history.employee_id is
  'A not null column in the complex primary key employee_id + start_date. Foreign key to employee_id column of the employee table.';

comment on column oehr_job_history.start_date is
  'A not null column in the complex primary key employee_id+start_date. Must be less than the end_date of the job_history table (enforced by constraint).';

comment on column oehr_job_history.end_date is
  'Last day of the employee in this job role. A not null column. Must be greater than the start_date of the job_history table (enforced by constraint).';

comment on column oehr_job_history.job_id is
  'Job role in which the employee worked in the past. Foreign key to job_id column in the jobs table. A not null column.';

comment on column oehr_job_history.department_id is
  'Department id in which the employee worked in the past. Foreign key to deparment_id column in the departments table.';