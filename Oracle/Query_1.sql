-- Query 01
SELECT Eno,Ename,Job_type,Hire_date
FROM Employee;

-- Query 02
SELECT DISTINCT(Job_type)
FROM Employee;

-- Query 03
SELECT Ename || ', ' || Job_type AS "Ename, Job_type"
FROM Employee;

SELECT CONCAT(CONCAT(Ename,', '), Job_Type) AS "Ename, Job_Type"
FROM Employee;

-- Query 04
SELECT Eno || ', ' || Ename || ', ' || Job_Type || ', ' || Manager || ', ' || Hire_date || ',' || Dno || ', ' || Commission || ', ' || Salary AS "THE_OUTPUT"
FROM Employee;

-- Query 05
SELECT Ename,Salary
FROM Employee
WHERE salary>2850;

-- Query 06
SELECT Ename,Dno
FROM Employee
WHERE Eno=790;

-- Query 07
SELECT Ename,Salary
FROM Employee
WHERE Salary<1500 OR Salary>2850;

SELECT Ename,Salary
FROM Employee
WHERE Salary NOT BETWEEN 1500 AND 2850;

-- Query 08
SELECT Ename,Dno
FROM Employee
WHERE Dno=10 OR Dno=30
ORDER BY Ename;

-- Query 09
SELECT Ename,Hire_date
FROM Employee
WHERE Hire_date> TO_DATE('1981-01-01','yyyy-mm-dd') AND Hire_date< TO_DATE('1981-12-31','yyyy-mm-dd');

SELECT Ename,Hire_date
FROM Employee
WHERE Hire_date BETWEEN TO_DATE('1981-01-01','yyyy-mm-dd') AND TO_DATE('1981-12-31','yyyy-mm-dd');

-- Query 10
SELECT Ename,Job_type
FROM Employee
WHERE Manager IS NULL;

-- Query 11
SELECT Ename,Salary,Commission
FROM Employee
WHERE Commission>0;

-- Query 12
SELECT Ename
FROM Employee
WHERE Ename LIKE '__a%';

-- Query 13
SELECT Ename
FROM Employee
WHERE (Ename LIKE '%r%r%' OR Ename LIKE '%a%a%' OR Ename LIKE '%R%r%' OR Ename LIKE '%A%a%') AND (Dno=30 OR Manager=778 OR Manager=788);

-- Query 14
SELECT Ename,Salary,Commission
FROM Employee
WHERE Commission > (Salary*1.05);

-- Query 15
SELECT TO_DATE(sysdate,'dd-mm-yyyy') AS "Date"
FROM Dual;

-- Query 16
SELECT Ename, Hire_date,NEXT_DAY(ADD_MONTHS(Hire_date,6),'MON') AS "Salary Review Date"
FROM Employee;

-- Query 17
SELECT Ename,Hire_date,trunc(MONTHS_BETWEEN(sysdate,Hire_date)) AS "Total Months"
FROM Employee, Dual;

-- Query 18
SELECT Ename || ' earns ' || Salary || ' monthly, but wants ' || 3*Salary AS "Dream Salary"
FROM Employee;

-- Query 19
SELECT UPPER(SUBSTR(Ename,1,1)) || LOWER(SUBSTR(Ename,-LENGTH(Ename)+1)) AS "Name",
CASE WHEN (Ename LIKE 'j%' OR Ename LIKE'J%' OR Ename LIKE 'a%' OR Ename LIKE 'A%' OR Ename LIKE 'm%' OR Ename LIKE 'M%') THEN LENGTH(Ename)
END AS "Length"
FROM Employee;

-- Query 20
SELECT Ename,Hire_date,TO_CHAR(Hire_date,'day')
FROM Employee;

-- Query 21
SELECT Ename,Employee.Dno,Dname
FROM Employee,Department
WHERE Department.Dno=Employee.Dno;

-- Query 22
SELECT DISTINCT(Job_type)
FROM Employee
WHERE Dno=30;

-- Query 23
SELECT Ename,Dname
FROM Employee,Department
WHERE (Ename LIKE '%A%' OR Ename LIKE '%a%') AND (Employee.Dno=Department.Dno);

-- Query 24
SELECT Ename,Job_type,Department.Dno,Dname
FROM Employee,Department
WHERE Location='Dallas' AND Department.Dno=Employee.Dno;

-- Query 25
SELECT e1.Ename AS "Emp Name",e1.Eno AS "Emp No",e2.Ename AS "Manager Name",e2.Eno AS "Manager No."
FROM Employee e1, Employee e2
WHERE e1.Manager=e2.Eno;

-- Query 26
SELECT e1.Ename AS "Emp Name",e1.Dno AS "Dept No",e1.Salary AS "Salary"
FROM Employee e1, Employee e2
WHERE e1.Dno=e2.Dno AND e1.Salary=e2.Salary AND e2.Commission>0;

-- Query 27
SELECT Ename,Salary,Lpad('',Salary/100+1,'*')
FROM Employee;


-- Query 28
SELECT MAX(Salary) AS "Highest",MIN(Salary) AS "Lowest",AVG(Salary) AS "Average"
FROM Employee;

-- Query 29
SELECT DISTINCT(e.Job_type),(SELECT COUNT(Eno) FROM Employee WHERE Job_type=e.Job_type) AS "No of Persons"
FROM Employee e;

-- Query 30
SELECT COUNT(DISTINCT(Manager)) AS "Manager"
FROM Employee;

-- Query 31
SELECT d.Dname,d.Location,(SELECT COUNT(Eno) FROM Employee WHERE Dno=d.Dno) AS "Count",(SELECT AVG(Salary) FROM Employee WHERE Dno=d.Dno) AS "Average"
FROM Department d
WHERE Dname IN (SELECT Dname FROM DEPARTMENT);

-- Query 32
SELECT Ename,Hire_date
FROM Employee
WHERE Dno=(SELECT Dno FROM Employee WHERE Ename='Blake') ;

-- Query 33
SELECT Eno,Ename,Salary
FROM Employee
WHERE Salary>(SELECT AVG(Salary) FROM Employee);

-- Query 34
SELECT Eno,Ename
FROM Employee
WHERE Dno IN (SELECT Dno FROM Employee WHERE Ename LIKE '%t%' OR Ename LIKE '%T%');

-- Query 35
SELECT Ename,Salary
FROM Employee
WHERE Manager=(SELECT Eno FROM Employee WHERE Ename='King');

-- Query 36
SELECT Dno,Ename,Job_type
FROM Employee
WHERE Dno=(SELECT Dno FROM Department WHERE Dname='Sales');

-- Query 37
SELECT EMPNO,ENAME
FROM Employee
WHERE Eno IN (SELECT UNIQUE MGR FROM EMP);
