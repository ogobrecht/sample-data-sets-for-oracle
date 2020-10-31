@../_global_scripts/disable_foreign_key_constraints.sql "{ table_filter: 'ED_%', dry_run: false }"

prompt REMOVE DATA

prompt - truncate table ed_dept
truncate table ed_dept;

prompt - truncate table ed_emp
truncate table ed_emp;
