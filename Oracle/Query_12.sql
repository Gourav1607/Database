
/*Table emp:

Fieldname	Data type	Constraint
eno 		numeric	 primary key
ename 		varchar(30)
address 	varchar2(30)
phone 		varchar2(10)
city 		varchar(20)
salary 		numeric(10,2)
grade 		char(5)
joindate 	date
*/

-- Write sql command to create the above given table
Create Table emp (eno numeric(3) primary key,
ename varchar2(30), address varchar2(30), phone varchar2(10), city varchar2(20),
salary numeric(10,2), grade char(5), joidate date);

-- Insert 10 records in the table (display records on the blank page)
insert into emp values(1, 'Bella Cullen','33 LIG', '452005','France',50000,'A','26-Nov-2010');
insert into emp values(2, 'Edward Cullen','34 Apollo','4720056','Frankfurt',70000,'A','1-Apr-2005');
insert into emp values(3, 'Robert Pattinson','34 PIG','452034','Seattle',90000,'B','28-Jan-2003');
insert into emp values(4, 'Vivek Roongta','35 GOK', '4722053','Delhi',80000,'D','21-May-2007');
insert into emp values(5, 'Rahul Sharma','33 LPG','652065','Bangaluru',40000,'F','26-Nov-2010');
insert into emp values(6, 'Anjali', '34 GOW', '462033','Hyderabad',50000,'A','26-Nov-2010');
insert into emp values(7, 'Simran Kaur','31 LVG','752075','Patiala',50000,'A','26-Nov-2010');
insert into emp values(8, 'Raj Sharma','33 LIG','452005','Indore',50000,'A','26-Nov-2010');
insert into emp values(9, 'Prem','33 OIG','125035','Mumbai',50000,'A','26-Nov-2010');
insert into emp values(10, 'Kiara','33 AIG','652065','Mumbai',50000,'A','26-Nov-2010');

-- Display total salary of A grade employees
Select sum(salary) from emp where grade='A';

-- Display total salary given in each city
Select city, sum(salary) from emp group by city;

-- Display all records in ascending order of salary
Select * from emp order by salary;

-- Display name and salary of employees for which the city is Mumbai
Select ename, salary, from emp where city = 'mumbai';

-- Display records for which salary is in the range 20,000 to 50,000
Select * from emp where salary between 20000 and 50000;

-- Update any 1 record in the table and set its salary to 50,000
Update emp set salary='50000' where eno=2;

-- Delete any one record from the table based on employee number
Delete from emp where eno=1;

-- Display average salary of employees for which grade is not A
Select avg(salary) from emp where grade <> 'A';

-- Display records for the employees who have joined before 1st April 2005.
Select * from emp where joindate < '1-apr-2005';

-- Display maximum salary given to an employee
Select max(salary) from emp;

-- Count how many employees are working in Mumbai
Select count(*) from emp where city = 'mumbai';

-- Add a new column called bonus
Alter table emp add (bonus numeric(5,2));

-- Update values in bonus column for each employee so that it contains bonus amount which is 5% of salary
Update emp set bonus = salary + salary*5/100;
