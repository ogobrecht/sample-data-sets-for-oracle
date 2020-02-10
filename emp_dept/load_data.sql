prompt LOAD DATA

@../_global_scripts/disable_all_foreign_key_constraints.sql ed

@data/ed_dept.sql
@data/ed_emp.sql

prompt - commit work
commit;

@../_global_scripts/enable_all_foreign_key_constraints.sql ed

@reset_identity_columns.sql