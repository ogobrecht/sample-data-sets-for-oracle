prompt - indexes on hr_job_history

create index hr_jhist_employee_ix on hr_job_history (employee_id);

create index hr_jhist_job_ix on hr_job_history (job_id);

create index hr_jhist_department_ix on hr_job_history (department_id);