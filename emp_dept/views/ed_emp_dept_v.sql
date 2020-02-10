prompt - view ed_emp_dept_v

create or replace view ed_emp_dept_v as
  select
    e.empno,
    e.ename,
    e.job,
    (select m.ename from ed_emp m where m.empno = e.mgr) mgr,
    e.hiredate,
    e.sal,
    e.comm,
    d.deptno,
    d.dname,
    d.loc
  from
    ed_emp e left join ed_dept d on e.deptno = d.deptno;