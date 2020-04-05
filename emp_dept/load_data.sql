prompt LOAD DATA

@data/ed_dept.sql
@data/ed_emp.sql

@../_global_scripts/enable_all_foreign_key_constraints.sql "ED"
@../_global_scripts/sync_sequence_values_to_data.sql "ED"
