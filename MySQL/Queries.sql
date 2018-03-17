-- Query 01
SELECT Eno,Ename,Job_type,Hire_date 
FROM Employee;

-- Query 02
SELECT DISTINCT(Job_type)
FROM Employee;

-- Query 03
SELECT CONCAT(Ename,', ',Job_type) AS 'Ename, Job_type'
FROM Employee;

-- Query 04
SELECT CONCAT_WS(', ',Eno,Ename,Job_Type,Manager,Hire_date,Dno,Commission,Salary) AS THE_OUTPUT
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

-- Query 08
SELECT Ename,Dno
FROM Employee
WHERE Dno=10 OR Dno=30
ORDER BY Ename;

-- Query 09
SELECT Ename,Hire_date
FROM Employee
WHERE DATE_FORMAT(Hire_date,'%Y')=1981;

SELECT Ename,hire_date
FROM Employee
WHERE Hire_date>'1980-12-31' AND Hire_date<'1982-01-01';

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
WHERE MID(Ename,3,1)='a';

-- Query 13
SELECT Ename
FROM Employee
WHERE ((length(Ename)-length(replace(Ename,'r','')) + length(Ename)-length(replace(Ename,'R','')))>1
	OR (length(Ename)-length(replace(Ename,'a','')) + length(Ename)-length(replace(Ename,'A','')))>1
      ) AND (Dno=30 OR Manager=778 OR Manager=788);

SELECT Ename
FROM Employee
WHERE (Ename LIKE '%R%R%' OR Ename LIKE '%A%A%') 
  AND (Dno=30 OR Manager=778 OR Manager=788);

-- Query 14
SELECT Ename,Salary,Commission
FROM Employee
WHERE Commmission> (Salary*1.05);

-- Query 15
SELECT DATE(NOW());

SELECT sysdate
FROM DUAL;

-- Query 16
SELECT Ename,Hire_date,DAYNAME(ADDDATE(Hire_date,INTERVAL 6 MONTH)),
CASE WHEN DAYNAME(ADDDATE(Hire_date,INTERVAl 6 MONTH))='MONDAY' THEN ADDDATE(Hire_date,INTERVAl 6 MONTH)
WHEN DAYNAME(ADDDATE(Hire_date,INTERVAl 6 MONTH))='SUNDAY' THEN ADDDATE(ADDDATE(Hire_date,INTERVAL 6 MONTH),INTERVAL 1 DAY) 
WHEN DAYNAME(ADDDATE(Hire_date,INTERVAl 6 MONTH))='SATURDAY' THEN ADDDATE(ADDDATE(Hire_date,INTERVAL 6 MONTH),INTERVAL 2 DAY)
WHEN DAYNAME(ADDDATE(Hire_date,INTERVAl 6 MONTH))='FRIDAY' THEN ADDDATE(ADDDATE(Hire_date,INTERVAL 6 MONTH),INTERVAL 3 DAY)  
WHEN DAYNAME(ADDDATE(Hire_date,INTERVAl 6 MONTH))='THURSDAY' THEN ADDDATE(ADDDATE(Hire_date,INTERVAL 6 MONTH),INTERVAL 4 DAY) 
WHEN DAYNAME(ADDDATE(Hire_date,INTERVAl 6 MONTH))='WEDNESDAY' THEN ADDDATE(ADDDATE(Hire_date,INTERVAL 6 MONTH),INTERVAL 5 DAY)
WHEN DAYNAME(ADDDATE(Hire_date,INTERVAl 6 MONTH))='TUESDAY' THEN ADDDATE(ADDDATE(Hire_date,INTERVAL 6 MONTH),INTERVAL 6 DAY)  
END AS 'Salary Review Date'
FROM Employee;

-- Query 17
SELECT Ename,Hire_date,DATE(NOW()),
       12*(YEAR(NOW())-YEAR(Hire_date))+MONTH(NOW())-MONTH(Hire_date) AS 'Total Months'
FROM Employee;

-- Query 18
SELECT CONCAT(Ename,' earns ',Salary,' monthly, but wants ',3*Salary) AS 'Dream Salary'
FROM Employee;

-- Query 19
SELECT CONCAT(UPPER(LEFT(Ename,1)),LOWER(RIGHT(Ename,LENGTH(Ename)-1))) AS 'Name',
CASE WHEN (LEFT(Ename,1)='j' OR LEFT(Ename,1)='a' OR LEFT(Ename,1)='m') THEN LENGTH(Ename) 
END AS 'Length'
FROM Employee;

-- Query 20
SELECT Ename,Hire_date,DAYNAME(Hire_date)
FROm Employee;

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
WHERE (Ename LIKE '%A%') AND (Employee.Dno=Department.Dno);

-- Query 24
SELECT Ename,Job_type,Department.Dno,Dname
FROM Employee,Department
WHERE Location='Dallas' AND Department.Dno=Employee.Dno;

-- Query 25
SELECT e1.Ename AS 'Emp Name',e1.Eno AS 'Emp No',e2.Ename AS 'Manager Name',e2.Eno AS 'Manager No.'
FROM Employee e1, Employee e2
WHERE e1.Manager=e2.Eno;

-- Query 26
SELECT e1.Ename AS 'Emp Name',e1.Dno AS 'Dept No',e1.Salary AS 'Salary'
FROM Employee e1, Employee e2
WHERE e1.Dno=e2.Dno AND e1.Salary=e2.Salary AND e2.Commission>0;

-- Query 27


-- Query 28
SELECT MAX(Salary) AS 'Highest',MIN(Salary) AS 'Lowest',AVG(Salary) AS 'Average'
FROM Employee;

-- Query 29
SELECT DISTINCT(e.Job_type),(SELECT COUNT(Eno) FROM Employee WHERE Job_type=e.Job_type)
FROM Employee e;

-- Query 30
SELECT COUNT(DISTINCT(Manager))
FROM Employee;

-- Query 31
SELECT d.Dname,d.Location,(SELECT COUNT(Eno) FROM Employee WHERE Dno=d.Dno),(SELECT AVG(Salary) FROM Employee WHERE Dno=d.Dno)
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
WHERE Dno IN (SELECT Dno FROM Employee WHERE Ename LIKE '%t%');

-- Query 35
SELECT Ename,Salary
FROM Employee
WHERE Manager=(SELECT Eno FROM Employee WHERE Ename='King');

-- Query 36
SELECT Dno,Ename,Job_type
FROM Employee
WHERE Dno=(SELECT Dno FROM Department WHERE Dname='Sales');