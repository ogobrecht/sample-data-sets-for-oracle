prompt LOAD DATA

@data/ed_dept.sql
@data/ed_emp.sql

prompt - commit work
commit;

@../_global_scripts/enable_all_foreign_key_constraints.sql "ED"

@reset_identity_columns.sql