prompt - indexes on oehr_job_history

create index oehr_jhist_department_ix on oehr_job_history (department_id);
create index oehr_jhist_employee_ix   on oehr_job_history (employee_id);
create index oehr_jhist_job_ix        on oehr_job_history (job_id);