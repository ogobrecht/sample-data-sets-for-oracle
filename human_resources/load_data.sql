prompt LOAD DATA

@../_global_scripts/disable_all_foreign_key_constraints.sql hr

@data/hr_countries.sql
@data/hr_departments.sql
@data/hr_employees.sql
@data/hr_job_history.sql
@data/hr_jobs.sql
@data/hr_locations.sql
@data/hr_regions.sql

prompt - commit work
commit;

@../_global_scripts/enable_all_foreign_key_constraints.sql hr

@reset_identity_columns.sql