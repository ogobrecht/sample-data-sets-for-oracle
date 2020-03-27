@../_global_scripts/disable_all_foreign_key_constraints.sql "ED"

prompt DROP OBJECTS

prompt - view ed_emp_dept_v
drop view ed_emp_dept_v;

prompt - table ed_dept
drop table ed_dept cascade constraints purge;

prompt - table ed_emp
drop table ed_emp cascade constraints purge;
