prompt - ref constraints on oehr_job_history

alter table oehr_job_history modify job_id        references oehr_jobs;
alter table oehr_job_history modify department_id references oehr_departments;
