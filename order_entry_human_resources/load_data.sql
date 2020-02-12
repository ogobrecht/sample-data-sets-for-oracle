prompt LOAD DATA

@../_global_scripts/disable_all_foreign_key_constraints.sql hr

@data/oehr_countries.sql
@data/oehr_customers.sql
@data/oehr_departments.sql
@data/oehr_employees.sql
@data/oehr_inventories.sql
@data/oehr_job_history.sql
@data/oehr_jobs.sql
@data/oehr_locations.sql
@data/oehr_regions.sql

prompt - commit work
commit;

@../_global_scripts/enable_all_foreign_key_constraints.sql hr

@reset_identity_columns.sql