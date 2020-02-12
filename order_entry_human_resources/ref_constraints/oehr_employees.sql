prompt - ref constraints on oehr_employees

alter table oehr_employees modify job_id        references oehr_jobs;
alter table oehr_employees modify manager_id    references oehr_employees;
alter table oehr_employees modify department_id references oehr_departments;
