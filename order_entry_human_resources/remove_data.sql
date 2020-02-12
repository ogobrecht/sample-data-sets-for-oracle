prompt REMOVE DATA

@../_global_scripts/disable_all_foreign_key_constraints.sql hr

prompt - truncate table oehr_countries
truncate table oehr_countries;

prompt - truncate table oehr_customers
truncate table oehr_customers;

prompt - truncate table oehr_departments
truncate table oehr_departments;

prompt - truncate table oehr_employees
truncate table oehr_employees;

prompt - truncate table oehr_inventories
truncate table oehr_inventories;

prompt - truncate table oehr_job_history
truncate table oehr_job_history;

prompt - truncate table oehr_jobs
truncate table oehr_jobs;

prompt - truncate table oehr_locations
truncate table oehr_locations;

prompt - truncate table oehr_regions
truncate table oehr_regions;
