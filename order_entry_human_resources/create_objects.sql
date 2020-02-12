prompt CREATE OBJECTS

@tables/oehr_countries.sql
@tables/oehr_customers.sql
@tables/oehr_departments.sql
@tables/oehr_employees.sql
@tables/oehr_inventories.sql
@tables/oehr_job_history.sql
@tables/oehr_jobs.sql
@tables/oehr_locations.sql
@tables/oehr_regions.sql

@indexes/oehr_countries.sql
@indexes/oehr_customers.sql
@indexes/oehr_departments.sql
@indexes/oehr_employees.sql
@indexes/oehr_inventories.sql
@indexes/oehr_job_history.sql
@indexes/oehr_locations.sql

@ref_constraints/oehr_countries.sql
@ref_constraints/oehr_customers.sql
@ref_constraints/oehr_departments.sql
@ref_constraints/oehr_employees.sql
@ref_constraints/oehr_inventories.sql
@ref_constraints/oehr_job_history.sql
@ref_constraints/oehr_locations.sql

@views/oehr_emp_details_view.sql

@procedures/oehr_add_job_history.sql
@procedures/oehr_secure_dml.sql

@triggers/oehr_secure_employees.sql
@triggers/oehr_update_job_history.sql

@../_global_scripts/manage_constraint_names.sql hr