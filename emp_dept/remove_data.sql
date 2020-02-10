prompt REMOVE DATA

@../_global_scripts/disable_all_foreign_key_constraints.sql ed

prompt - truncate table ed_Dept
truncate table ed_dept;

prompt - truncate table edp_em
truncate table ed_emp;
