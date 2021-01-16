--CREATE TABLE Employee (
--    ID int NOT NULL,
--    LastName varchar(255) NOT NULL,
--    FirstName varchar(255),
--    Age int,
--    City varchar(255) DEFAULT 'Mumbai',
--    DateOfBirth date DEFAULT GETDATE(),
--    Salary   DECIMAL (18, 2) DEFAULT 5000.00
--)

--Insert into Employee (ID, LastName, Age) values(1, 'Rout', 30)

--Select * from Employee

--CREATE TABLE Customer 
--( 
--    Id      INT UNIQUE, 
--    NAME    VARCHAR(30) UNIQUE, 
--    Emailid VARCHAR(100) UNIQUE 
--) 

--INSERT customer  VALUES (10,  'AA',  'pranayakumar777@gmail.com')

--INSERT customer  VALUES (10,  'AA',  'pranayakumar777@gmail.com')

--INSERT customer  VALUES (11,  'AAA',  Null)

--INSERT customer  VALUES (12,  Null,  'pranayakumar77@gmail.com')

--INSERT customer  VALUES (11,  null,  'ff')


--Imposing Constraint on Column Level:

--CREATE TABLE Customer_1
--( 
--    Id      INT CONSTRAINT cid_unique UNIQUE, 
--    NAME    VARCHAR(30), 
--    Emailid VARCHAR(100) CONSTRAINT email_unique UNIQUE 
--) 

--Imposing Constraint on Table Level:

--CREATE TABLE customer_3 
--( 
--    Id      INT, 
--    NAME    VARCHAR(30), 
--    Emailid VARCHAR(100),
--    CONSTRAINT cusid_unique UNIQUE(Id), 
--    CONSTRAINT cusemail_unique UNIQUE(Emailid)
--) 

--Composite Constraints

--CREATE TABLE BranchDetails 
--( 
--    City           VARCHAR(50), 
--    Branchcode     VARCHAR(10), 
--    Branchlocation VARCHAR (30), 
--    CONSTRAINT city_bc_unique UNIQUE(City, Branchcode) 
--)

--Insert into BranchDetails (City, Branchcode, Branchlocation) values('Mumbai', 'xyz','abc') -- Allowed
--Insert into BranchDetails (City, Branchcode, Branchlocation) values('Mumbai', 'abc','pqr') -- Allowed
--Insert into BranchDetails (City, Branchcode, Branchlocation) values('Mumbai', 'xyz','pqr') --Not Allowed

-- Check Constraint

--CREATE TABLE Employee_1
--( 
--    Emp_id       INT NOT NULL default 10000 CHECK(Emp_id BETWEEN 0 AND 1000), 
--    Emp_name     VARCHAR(30) NOT NULL, 
--	Emp_Address  varchar(100) unique not null default 'aaa',
--    Entered_date DATETIME NOT NULL CHECK(Entered_date <= CURRENT_TIMESTAMP), 
--    Dept_no      INT unique CHECK(Dept_no > 0 AND Dept_no < 100) 
--)

--INSERT INTO Employee_1
--            (Emp_id, 
--             Emp_name, 
--             Entered_date, 
--             Dept_no) 
--VALUES      (1, 
--             'Pranaya', 
--             '2018-04-28 12:18:46.813', 
--             10) -- Allowed 
--			 INSERT INTO Employee_1
--            (
--             Emp_name, 
--			 Emp_Address,
--             Entered_date, 
--             Dept_no) 
--VALUES      (
--             'Pranaya', 
--			 'sss',
--             '2018-04-28 12:18:46.813', 
--             20) --Not Allowed
--INSERT INTO Employee_1
--            (Emp_id, 
--             Emp_name, 
--             Entered_date, 
--             Dept_no) 
--VALUES      (1001, 
--             'Pranaya', 
--             '2018-04-28 12:18:46.813', 
--             20) --Not Allowed

--select * from Employee_1

-- Primary Key

--CREATE TABLE Branches 
--( 
--    Bcode INT PRIMARY KEY, 
--    Bname VARCHAR(40), 
--    Bloc  CHAR(40) PRIMARY KEY 
--)

--CREATE TABLE Branches 
--( 
--    Bcode INT PRIMARY KEY, 
--    Bname VARCHAR(40), 
--    Bloc  CHAR(40) 
--)

--INSERT Branches VALUES (1021, 'SBI', 'SRNAGAR')

--INSERT Branches VALUES (1021, 'SBI', 'SRNAGAR')

--INSERT Branches VALUES (NULL, ‘SBI’, ‘SRNAGAR’) 

--Composite Primary Key

--CREATE TABLE BranchDetails_1
--( 
--    City  VARCHAR(40), 
--    Bcode INT, 
--    Bloc  VARCHAR(30), 
--    PRIMARY KEY(City, Bcode) 
--) 

--Insert into BranchDetails_1 (City, Bcode, Bloc) values('Mumbai', 10, 'Goregaon') 
--Insert into BranchDetails_1 (City, Bcode, Bloc) values('Mumbai1', 10, 'Goregaon') 
--Insert into BranchDetails_1 (City, Bcode, Bloc) values('Mumbai', 101, 'Goregaon')
--Insert into BranchDetails_1 (City, Bcode, Bloc) values('Mumbai', 10, 'Goregaon') 

--FOREIGN KEY

--CREATE TABLE Dept 
--( 
--    Dno   INT PRIMARY KEY, 
--    Dname VARCHAR(30), 
--    Dloc  CHAR(40) 
--) 
--GO

--INSERT Dept VALUES (10, '.NET', 'HYD') 
--INSERT Dept VALUES (20, 'JAVA', 'PUNE') 
--INSERT Dept VALUES (30, 'PHP', 'DELHI') 
--Go

--Select * from Dept
--Go
--CREATE TABLE Employee_00 
--( 
--    Eid    INT PRIMARY KEY, 
--    Ename  VARCHAR(30), 
--    Salary MONEY, 
--    Dno    INT FOREIGN KEY REFERENCES Dept(Dno) 
--) 

--INSERT into Employee_00 VALUES (101,'AA', 25000, 10) -- Allowed
--INSERT into Employee_00 VALUES (102,'BB', 32000, 20) -- Allowed
--INSERT into Employee_00 VALUES (103,'CC', 52000, 40) -- Not Allowed

--UPDATE DEPT SET DNO = 100 WHERE DNO = 10 -- Not Allowed

--Column Level constraint

--CREATE TABLE Employee_11 
--( 
--    Empid  INT, 
--    Ename  VARCHAR(40), 
--    Job    VARCHAR(30), 
--    Salary MONEY, 
--    Deptno INT CONSTRAINT deptn0_fk REFERENCES Dept(Dno)
--)

--Table Level Constraint

--CREATE TABLE Employee_111 
--( 
--    Empid  INT, 
--    Ename  VARCHAR(40), 
--    Job    VARCHAR(30), 
--    Salary MONEY, 
--    Deptno INT, 
--    CONSTRAINT deptno_fk FOREIGN KEY (Deptno) REFERENCES Dept(Dno) 
--) 

-- Releations Of Multiple tables

--CREATE TABLE Customer_000
--( 
--    Cid    INT PRIMARY KEY, 
--    Cname  VARCHAR(40), 
--    Cmobno CHAR(10) 
--)

--INSERT INTO Customer_000 VALUES (1, 'AA', '9853977973') 
--INSERT INTO Customer_000 VALUES (2, 'BB', '8895558077') 
--INSERT INTO Customer_000 VALUES (3, 'CC', '7021801173') 

--CREATE TABLE Products 
--( 
--    Pcode INT PRIMARY KEY, 
--    Pname VARCHAR(20), 
--    Price MONEY 
--) 

--INSERT INTO Products VALUES (10,'C',500) 
--INSERT INTO Products VALUES (20,'C++',1000) 
--INSERT INTO Products VALUES (30,'.NET',3500) 
--INSERT INTO Products VALUES (40,'SQL',1800) 

--CREATE TABLE Orders 
--( 
--    Odid     INT PRIMARY KEY, 
--    Ordate   DATE, 
--    Quantity INT, 
--    Cid      INT CONSTRAINT Cid_fk REFERENCES Customer_000(Cid), 
--    Pcode    INT FOREIGN KEY REFERENCES Products(Pcode) 
--)

--INSERT INTO Orders VALUES (101,'2017/12/20',9,1,10) 
--INSERT INTO Orders VALUES (102,'2017/12/20',10,2,10) 
--INSERT INTO Orders VALUES (103,'2017/12/21',6,3,20) 
--INSERT INTO Orders VALUES (104,'2017/12/22',11,1,40) 
--INSERT INTO Orders VALUES (105,'2017/12/23',8,1,30) 

--Select * from Orders

--CREATE TABLE EMP(EMPID INT, ENAME VARCHAR(30), SALARY MONEY)
--ALTER TABLE EMP ALTER COLUMN EMPID INT NOT NULL
--ALTER TABLE EMP ADD CONSTRAINT X PRIMARY KEY (EMPID)
--ALTER TABLE EMP ADD CONSTRAINT Y UNIQUE (ENAME)
--ALTER TABLE EMP ADD CONSTRAINT z CHECK (SALARY > 8000)

--ALTER TABLE EMP DROP CONSTRAINT Y
--ALTER TABLE EMP DROP CONSTRAINT Z

--CREATE TABLE DEP(DNO INT, DNAME VARCHAR(30), EID INT)
--ALTER TABLE DEP ADD CONSTRAINT Q FOREIGN KEY (EID) REFERENCES EMP(EMPID)


--Cascading Referential Integrity Constraints

--CREATE TABLE Gender 
--( 
--    Id     INT PRIMARY KEY, 
--    Gender NVARCHAR(50) 
--)

---- Insert some test data in Gender Table
--Insert into Gender values (1, 'Male')
--Insert into Gender values (2, 'Female')
--Insert into Gender values (3, 'Unknown')


--CREATE TABLE [Person](
--  [Id] [int] PRIMARY KEY,
--  [Name] [varchar](100) NOT NULL,
--  [Email] [varchar](100) NOT NULL,
--  [GenderID] [int] NULL
--)

---- Add a foreign key reference using query
--Alter table Person 
--add constraint Person_GenderId_FK FOREIGN KEY (GenderId) references Gender(ID)

----Insert some test data in Person Table
--Insert into Person values (1, 'abc','abc@gmail.com',1)
--Insert into Person values (2, 'pqr','pqr@gmail.com',2)
--Insert into Person values (3, 'xyz','xyz@gmail.com',3)

--CREATE TABLE [Person_1](
--  [Id] [int] PRIMARY KEY,
--  [Name] [varchar](100) NOT NULL,
--  [Email] [varchar](100) NOT NULL,
--  [GenderID] [int] CONSTRAINT FK_Person1_GenderID REFERENCES dbo.Gender(Id) 
--  ON DELETE CASCADE 
--  ON UPDATE CASCADE
--)

--Insert some test data in Person Table
--Insert into Person_1 values (1, 'abc','abc@gmail.com',1)
--Insert into Person_1 values (2, 'pqr','pqr@gmail.com',2)
--Insert into Person_1 values (3, 'xyz','xyz@gmail.com',3)

--select * from Person_1

--DELETE FROM Gender WHERE Id = 2  -- Allowed
--UPDATE Gender SET Id = 4 where Gender = 'Male'  -- Allowed

--Self Referential Integrity Constraint

--CREATE TABLE Employee_self 
--( 
--    EmpID  INT CONSTRAINT EmpID_PK PRIMARY KEY, 
--    Ename  VARCHAR(50) NOT NULL, 
--    Job    VARCHAR(50), 
--    ManagerID    INT CONSTRAINT ManagerID_FK REFERENCES Employee_self(EmpID), 
--    Salary MONEY DEFAULT 3000 CONSTRAINT Salary_CK CHECK (Salary BETWEEN 5000 AND 15000) 
--) 

--Identity column

--Create Table Person_Identity
--(
--     PersonId int identity(1, 1),
--     Name nvarchar(20)
--)
--GO

--ALTER TABLE Person_Identity
--DROP COLUMN PersonId;  
--GO

--ALTER TABLE Person_Identity
--ADD PersonId INT IDENTITY(1,1); 
--GO

--Insert into Person_Identity values ('Bob')
--Insert into Person_Identity values ('James')

--select * from Person_Identity

--Insert into Person_Identity values (1,'Mark')
--Insert into Person_Identity values ('Mark')

--Delete from Person_Identity where PersonId = 3
--Insert into Person_Identity values('Smith')

--SET Identity_Insert Person_Identity ON
--Insert into Person_Identity(PersonId, Name) values(3, 'Sara')
--SET Identity_Insert Person_Identity OFF

--select * from Person_Identity

--Delete from Person_Identity -- Delete all the records from the Person table

--DBCC CHECKIDENT(Person_Identity, RESEED, 0) -- Use DBCC command to reset the identity column value

-- Insert some data into the Person table
--Insert into Person_Identity values ('Bob')
--Insert into Person_Identity values ('James')

--Select SCOPE_IDENTITY()
--Select @@IDENTITY
--Select IDENT_CURRENT('Person_Identity')

-- Sequence Object

--CREATE SEQUENCE [schema_name . ] sequence_name
--    [ AS [ built_in_integer_type | user-defined_integer_type ] ]
--    [ START WITH <constant> ]
--    [ INCREMENT BY <constant> ]
--    [ { MINVALUE [ <constant> ] } | { NO MINVALUE } ]
--    [ { MAXVALUE [ <constant> ] } | { NO MAXVALUE } ]
--    [ CYCLE | { NO CYCLE } ]
--    [ { CACHE [ <constant> ] } | { NO CACHE } ]
--    [ ; ] 

--CREATE SEQUENCE [dbo].[SequenceObject]
--AS INT
--START WITH 1 
--INCREMENT BY 1

--SELECT NEXT VALUE FOR [dbo].[SequenceObject]

--If you want to see what the current Sequence value before generating the next, use sys.sequences

--SELECT * FROM sys.sequences WHERE name = 'SequenceObject'

--Alter the object to reset the sequence value: 

--ALTER SEQUENCE [SequenceObject] RESTART WITH 1

--To ensure the value now going to starts from 1, select the next sequence value as shown below.

--


--CREATE TABLE Employees_seq
--(
--    Id INT PRIMARY KEY,
--    Name NVARCHAR(50),
--    Gender NVARCHAR(10)
--)
-- Generate and insert Sequence values

--INSERT INTO Employees_seq VALUES
--(NEXT VALUE for [dbo].[SequenceObject], 'Ben', 'Male')
--INSERT INTO Employees_seq VALUES
--(NEXT VALUE for [dbo].[SequenceObject], 'Sara', 'Female')

--SELECT * FROM Employees_seq

--CREATE SEQUENCE [dbo].[SequenceObject_Decrement] 
--AS INT
--START WITH 100
--INCREMENT BY -1

--CREATE SEQUENCE [dbo].[SequenceObject_MINMax]
--START WITH 100
--INCREMENT BY 10
--MINVALUE 100
--MAXVALUE 150

--CREATE SEQUENCE [dbo].[SequenceObject_cycle]
--INCREMENT BY 10
--MINVALUE 100
--MAXVALUE 150
--CYCLE

--SELECT NEXT VALUE FOR [dbo].[SequenceObject_cycle]

--ALTER SEQUENCE [dbo].[SequenceObject_cycle]
--INCREMENT BY 10
--MINVALUE 100
--MAXVALUE 150
--CACHE 10
--CYCLE

--Drop Sequence SequenceObject

--CREATE TABLE dbo.Customer_Seq (
--  ID INT DEFAULT(NEXT VALUE FOR DBO.SequenceObject_MINMax),
--    Name VARCHAR(100)
--)
--GO
--INSERT INTO dbo.Customer_Seq(Name)
--VALUES('Pranaya Kumar'),
--('Mitali Rout')
--GO

