prompt - indexes on oehr_employees

create index oehr_emp_department_ix on oehr_employees (department_id);
create index oehr_emp_job_ix        on oehr_employees (job_id);
create index oehr_emp_manager_ix    on oehr_employees (manager_id);
create index oehr_emp_name_ix       on oehr_employees (last_name, first_name);