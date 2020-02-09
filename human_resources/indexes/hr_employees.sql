prompt - indexes on hr_employees

create index hr_emp_department_ix on hr_employees (department_id);
create index hr_emp_job_ix        on hr_employees (job_id);
create index hr_emp_manager_ix    on hr_employees (manager_id);
create index hr_emp_name_ix       on hr_employees (last_name, first_name);