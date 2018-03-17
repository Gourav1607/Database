create table emp(
    empno number(5),
    ename varchar2(30),
    job varchar2(20),
    mgr number(5),
    hire date,
    sal number(6),
    comm number(6),
    deptno number(2));

--Insert data
insert into emp(empno,ename,job,mgr,hire,sal,comm,deptno)
    values(&empno,'&ename','&job',&mgr,'&hire',&sal,&comm,&deptno);

-- Query 1
select sum(sal)
from emp
where job='manager';

-- Query 2
select ename
from emp
where hire<'1-jan-1992';

-- Query 3
select ename
from emp
where deptno=20 and job='manager';

--Query 4
select distinct(job)
from emp;
