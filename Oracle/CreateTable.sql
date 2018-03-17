DROP TABLE Department;
CREATE TABLE Department(
	Dno			INT			NOT NULL,
	Dname		VARCHAR(15)	DEFAULT NULL,
	Location	VARCHAR(15)	DEFAULT 'NEW DELHI',
	PRIMARY KEY (Dno)
);

DROP TABLE Employee;
CREATE TABLE Employee(
	Eno			CHAR(3)			NOT NULL,
	Ename		VARCHAR(10)		NOT NULL,
	Job_Type	VARCHAR(10)		NOT NULL,
	Manager		CHAR(3),
	Hire_Date	Date			NOT NULL,
	Dno			INT,
	Commission	DECIMAL(10,2),
	Salary		DECIMAL(7,3)	NOT NULL,
	PRIMARY KEY (Eno)
);