prompt CREATE OBJECTS

@tables/ed_dept.sql
@tables/ed_emp.sql

@indexes/ed_emp.sql

@ref_constraints/ed_emp.sql

@views/ed_emp_dept_v.sql

@../_global_scripts/create_missing_fk_indexes.sql ED
@../_global_scripts/unify_index_names.sql ED
@../_global_scripts/unify_constraint_names.sql ED
