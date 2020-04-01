prompt CREATE OBJECTS

@tables/drs_actor.sql
@tables/drs_city.sql
@tables/drs_country.sql
@tables/xxx.sql
@tables/xxx.sql
@tables/xxx.sql
@tables/xxx.sql
@tables/xxx.sql


prompt - indexes
-- foreign key indexes are created automatically with a script
create index drs_temp_name_01_ix on actor (last_name);

prompt - referential constraints (disabled)
alter table drs_city modify country_id references drs_country disable;

@views/ed_emp_dept_v.sql

@../_global_scripts/create_missing_foreign_key_indexes.sql "DRS"
@../_global_scripts/unify_index_names.sql "DRS"
@../_global_scripts/unify_constraint_names.sql "DRS"
