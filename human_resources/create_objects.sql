prompt CREATE OBJECTS

@tables/hr_countries.sql
@tables/hr_departments.sql
@tables/hr_employees.sql
@tables/hr_job_history.sql
@tables/hr_jobs.sql
@tables/hr_locations.sql
@tables/hr_regions.sql

@indexes/hr_countries.sql
@indexes/hr_departments.sql
@indexes/hr_employees.sql
@indexes/hr_job_history.sql
@indexes/hr_locations.sql

@ref_constraints/hr_countries.sql
@ref_constraints/hr_departments.sql
@ref_constraints/hr_employees.sql
@ref_constraints/hr_job_history.sql
@ref_constraints/hr_locations.sql

@views/hr_emp_details_view.sql

@procedures/hr_add_job_history.sql
@procedures/hr_secure_dml.sql

@triggers/hr_secure_employees.sql
@triggers/hr_update_job_history.sql

@../_global_scripts/manage_constraint_names.sql hr