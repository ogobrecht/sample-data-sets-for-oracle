prompt - ref constraints on hr_job_history

alter table hr_job_history modify job_id        references hr_jobs;
alter table hr_job_history modify department_id references hr_departments;
