prompt LOAD DATA

@data/ed_dept.sql
@data/ed_emp.sql

@../_global_scripts/enable_foreign_key_constraints.sql "table_filter=ED\_%  dry_run=false"
@../_global_scripts/sync_sequence_values_to_data.sql   "table_filter=ED\_%  dry_run=false"
