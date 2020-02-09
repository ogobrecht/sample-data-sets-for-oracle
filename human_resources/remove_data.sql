prompt REMOVE DATA

@../_global_scripts/disable_all_foreign_key_constraints.sql hr

prompt - truncate table hr_countries
truncate table hr_countries;

prompt - truncate table hr_departments
truncate table hr_departments;

prompt - truncate table hr_employees
truncate table hr_employees;

prompt - truncate table hr_job_history
truncate table hr_job_history;

prompt - truncate table hr_jobs
truncate table hr_jobs;

prompt - truncate table hr_locations
truncate table hr_locations;

prompt - truncate table hr_regions
truncate table hr_regions;
