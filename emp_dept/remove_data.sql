@../_global_scripts/disable_all_foreign_key_constraints.sql "ED"

prompt REMOVE DATA

prompt - truncate table ed_dept
truncate table ed_dept;

prompt - truncate table ed_emp
truncate table ed_emp;
