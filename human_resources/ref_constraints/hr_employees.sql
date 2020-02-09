prompt - ref constraints on hr_employees

alter table hr_employees modify job_id        references hr_jobs;
alter table hr_employees modify manager_id    references hr_employees;
alter table hr_employees modify department_id references hr_departments;
