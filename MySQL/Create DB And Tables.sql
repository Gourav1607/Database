CREATE DATABASE syllabus;

USE syllabus;
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee ( 
	Eno CHAR(3) DEFAULT NULL,
	Ename VARCHAR(50) NOT NULL,
	Job_type VARCHAR(50) NOT NULL,
	Manager CHAR(3) DEFAULT NULL,
	Hire_date DATE NOT NULL,
	Dno INT(11) DEFAULT NULL,
	Commission DECIMAL(10,2) DEFAULT NULL,
	Salary DECIMAL(7,2) NOT NULL,
	PRIMARY KEY (Eno)
	);


INSERT INTO Employee VALUES (765,'Martin','Sales_man',198,'1981-04-22',30,1400,1250);
INSERT INTO Employee VALUES (756,'Jones','Manager',783,'1981-04-02',20,0,2300);
INSERT INTO Employee VALUES (752,'Ward','Sales_man',769,'1981-02-22',30,500,1300);
INSERT INTO Employee VALUES (749,'Allan','Sales_man',769,'1981-02-20',30,300,2000);
INSERT INTO Employee VALUES (736,'Smith','Clerk',790,'1980-12-17',20,0,1000);
INSERT INTO Employee VALUES (793,'Miller','Clerk',788,'1982-01-23',40,0,1300);
INSERT INTO Employee VALUES (792,'Ford','Analyst',756,'1981-12-03',20,0,2600);
INSERT INTO Employee VALUES (790,'James','Clerk',769,'1981-12-03',30,0,950);
INSERT INTO Employee VALUES (787,'Adames','Clerk',778,'1983-01-12',20,0,1150);
INSERT INTO Employee VALUES (784,'Turner','Sales_man',769,'1981-09-08',30,0,1450);
INSERT INTO Employee VALUES (783,'King','President',NULL,'1981-11-17',10,0,2950);
INSERT INTO Employee VALUES (788,'Scott','Analyst',756,'1982-12-09',20,0,2850);
INSERT INTO Employee VALUES (778,'Clark','Manager',783,'1981-06-09',10,0,2900);
INSERT INTO Employee VALUES (769,'Blake','Manager',783,'1981-05-01',30,0,2870);

SELECT * FROM Employee;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
	Dno INT DEFAULT NULL,
	Dname VARCHAR(50) DEFAULT NULL,
	Location VARCHAR(50) DEFAULT 'New Delhi', 
	PRIMARY KEY (Dno)
);

INSERT INTO Department VALUES (10,'Accounting','New York');
INSERT INTO Department VALUES (20,'Research','Dallas');
INSERT INTO Department VALUES (30,'Sales','Chicago');
INSERT INTO Department VALUES (40,'Operation','Boston');
INSERT INTO Department VALUES (50,'Marketing','New Delhi');

SELECT * FROM Department;