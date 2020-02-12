prompt DROP OBJECTS

@../_global_scripts/disable_all_foreign_key_constraints.sql hr

prompt - procedure oehr_add_job_history
drop procedure oehr_add_job_history;

prompt - procedure oehr_secure_dml
drop procedure oehr_secure_dml;

prompt - view oehr_emp_details_view
drop view oehr_emp_details_view;

prompt - table oehr_countries
drop table oehr_countries cascade constraints purge;

prompt - table oehr_customers
drop table oehr_customers cascade constraints purge;

prompt - table oehr_departments
drop table oehr_departments cascade constraints purge;

prompt - table oehr_employees
drop table oehr_employees cascade constraints purge;

prompt - table oehr_inventories
drop table oehr_inventories cascade constraints purge;

prompt - table oehr_job_history
drop table oehr_job_history cascade constraints purge;

prompt - table oehr_jobs
drop table oehr_jobs cascade constraints purge;

prompt - table oehr_locations
drop table oehr_locations cascade constraints purge;

prompt - table oehr_regions
drop table oehr_regions cascade constraints purge;