prompt CREATE OBJECTS

@tables/ed_dept.sql
@tables/ed_emp.sql

prompt - 2 referential constraints (disabled)
-- this data model has no clean naming conventions - automatic foreign key generation will only work partially
alter table ed_emp modify deptno references ed_dept disable;
alter table ed_emp modify mgr    references ed_emp  disable;

@views/ed_emp_dept_v.sql

@../_global_scripts/create_missing_foreign_key_indexes.sql "table_prefix=ed  dry_run=false"
@../_global_scripts/unify_index_names.sql                  "table_prefix=ed  dry_run=false"
@../_global_scripts/unify_constraint_names.sql             "table_prefix=ed  dry_run=false"
