prompt - ref constraints on ed_emp

alter table ed_emp modify deptno references ed_dept;
alter table ed_emp modify mgr    references ed_emp;
