prompt - insert into ed_emp
set define off

begin
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7839','KING','PRESIDENT',null,to_date('17.11.81','DD.MM.RR'),'5000',null,'10');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7698','BLAKE','MANAGER','7839',to_date('01.05.81','DD.MM.RR'),'2850',null,'30');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7782','CLARK','MANAGER','7839',to_date('09.06.81','DD.MM.RR'),'2450',null,'10');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7566','JONES','MANAGER','7839',to_date('02.04.81','DD.MM.RR'),'2975',null,'20');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7788','SCOTT','ANALYST','7566',to_date('09.12.82','DD.MM.RR'),'3000',null,'20');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7902','FORD','ANALYST','7566',to_date('03.12.81','DD.MM.RR'),'3000',null,'20');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7369','SMITH','CLERK','7902',to_date('17.12.80','DD.MM.RR'),'800',null,'20');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7499','ALLEN','SALESMAN','7698',to_date('20.02.81','DD.MM.RR'),'1600','300','30');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7521','WARD','SALESMAN','7698',to_date('22.02.81','DD.MM.RR'),'1250','500','30');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7654','MARTIN','SALESMAN','7698',to_date('28.09.81','DD.MM.RR'),'1250','1400','30');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7844','TURNER','SALESMAN','7698',to_date('08.09.81','DD.MM.RR'),'1500','0','30');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7876','ADAMS','CLERK','7788',to_date('12.01.83','DD.MM.RR'),'1100',null,'20');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7900','JAMES','CLERK','7698',to_date('03.12.81','DD.MM.RR'),'950',null,'30');
  insert into ed_emp (empno,ename,job,mgr,hiredate,sal,comm,deptno) values ('7934','MILLER','CLERK','7782',to_date('23.01.82','DD.MM.RR'),'1300',null,'10');
end;
/