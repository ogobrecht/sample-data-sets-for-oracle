prompt CREATE OBJECTS

@tables/drs_actor.sql
@tables/drs_address.sql
@tables/drs_category.sql
@tables/drs_city.sql
@tables/drs_country.sql
@tables/drs_customer.sql
@tables/drs_film.sql
@tables/drs_language.sql
@tables/xxx.sql
@tables/xxx.sql
@tables/xxx.sql
@tables/xxx.sql
@tables/xxx.sql
@tables/xxx.sql
@tables/xxx.sql
@tables/xxx.sql


prompt - indexes
-- foreign key indexes are created automatically with a script
create index drs_temp_name_01_ix on drs_actor    (last_name);
create index drs_temp_name_01_ix on drs_customer (last_name);

prompt - referential constraints (disabled)
alter table drs_address  modify city_id              references drs_city     disable;
alter table drs_city     modify country_id           references drs_country  disable;
alter table drs_customer modify address_id           references drs_address  disable;
alter table drs_customer modify store_id             references drs_store    disable;
alter table drs_film     modify language_id          references drs_language disable;
alter table drs_film     modify original_language_id references drs_language disable;

@views/ed_emp_dept_v.sql

@../_global_scripts/create_missing_foreign_key_indexes.sql "DRS"
@../_global_scripts/unify_index_names.sql "DRS"
@../_global_scripts/unify_constraint_names.sql "DRS"
