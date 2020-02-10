prompt DROP OBJECTS

@../_global_scripts/disable_all_foreign_key_constraints.sql hr

prompt - procedure hr_add_job_history
drop procedure hr_add_job_history;

prompt - procedure hr_secure_dml
drop procedure hr_secure_dml;

prompt - view hr_emp_details_view
drop view hr_emp_details_view;

prompt - table hr_countries
drop table hr_countries cascade constraints purge;

prompt - table hr_departments
drop table hr_departments cascade constraints purge;

prompt - table hr_employees
drop table hr_employees cascade constraints purge;

prompt - table hr_job_history
drop table hr_job_history cascade constraints purge;

prompt - table hr_jobs
drop table hr_jobs cascade constraints purge;

prompt - table hr_locations
drop table hr_locations cascade constraints purge;

prompt - table hr_regions
drop table hr_regions cascade constraints purge;