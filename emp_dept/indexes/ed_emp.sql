prompt - indexes on ed_emp

create index ed_emp_mgr_ix    on ed_emp (mgr);
create index ed_emp_deptno_ix on ed_emp (deptno);
