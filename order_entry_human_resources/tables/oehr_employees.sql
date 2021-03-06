prompt - table oehr_employees

create table oehr_employees (
  employee_id    integer           generated by default on null as identity (nocache nocycle),
  first_name     varchar2(20 char) ,
  last_name      varchar2(25 char) not null,
  email          varchar2(25 char) not null,
  phone_number   varchar2(20 char) ,
  hire_date      date              not null,
  job_id         varchar2(10 char) not null,
  salary         number(8,2)       ,
  commission_pct number(2,2)       ,
  manager_id     integer           ,
  department_id  integer           ,
  --
  primary key (employee_id)        ,
  unique      (email)              ,
  check       (salary > 0)
);

comment on table oehr_employees is
  'Employees table. Contains 107 rows. References with departments, jobs, job_history tables. Contains a self reference.';

comment on column oehr_employees.employee_id is
  'Primary key of employees table.';

comment on column oehr_employees.first_name is
  'First name of the employee. A not null column.';

comment on column oehr_employees.last_name is
  'Last name of the employee. A not null column.';

comment on column oehr_employees.email is
  'Email id of the employee.';

comment on column oehr_employees.phone_number is
  'Phone number of the employee. Includes country code and area code.';

comment on column oehr_employees.hire_date is
  'Date when the employee started on this job. A not null column.';

comment on column oehr_employees.job_id is
  'Current job of the employee. Foreign key to job_id column of the jobs table. A not null column.';

comment on column oehr_employees.salary is
  'Monthly salary of the employee. Must be greater than zero (enforced by constraint).';

comment on column oehr_employees.commission_pct is
  'Commission percentage of the employee. Only employees in sales department elgible for commission percentage.';

comment on column oehr_employees.manager_id is
  'Manager id of the employee. Has same domain as manager_id in departments table. Foreign key to employee_id column of employees table (useful for reflexive joins and CONNECT BY query).';

comment on column oehr_employees.department_id is
  'Department id where employee works. Foreign key to department_id column of the departments table.';