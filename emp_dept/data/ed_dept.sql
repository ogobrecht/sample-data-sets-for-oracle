prompt - insert into ed_dept
set define off

begin
  insert into ed_dept (deptno,dname,loc) values ('10','ACCOUNTING','NEW YORK');
  insert into ed_dept (deptno,dname,loc) values ('20','RESEARCH','DALLAS');
  insert into ed_dept (deptno,dname,loc) values ('30','SALES','CHICAGO');
  insert into ed_dept (deptno,dname,loc) values ('40','OPERATIONS','BOSTON');
end;
/

commit;
