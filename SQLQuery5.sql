--Create Employee_Assignment table
--CREATE TABLE Employee_Assignment
--(
--  ID INT PRIMARY KEY IDENTITY(1,1),
--  Name VARCHAR(100),
--  EmailID VARCHAR(100),
--  Gender VARCHAR(100),
--  Department VARCHAR(100),
--  Salary INT,
--  Age INT,
--  CITY VARCHAR(100)
--)
--GO

----Insert some data into Employee_Assignment table
--INSERT INTO Employee_Assignment VALUES('Pranaya','Pranaya@g.com','Male', 'IT', 25000, 30,'Mumbai')
--INSERT INTO Employee_Assignment VALUES('Tarun','Tarun@g.com','Male', 'Payroll', 30000, 27,'Odisha')
--INSERT INTO Employee_Assignment VALUES('Priyanka','Priyanka@g.com','Female', 'IT', 27000, 25,'Bangalore')
--INSERT INTO Employee_Assignment VALUES('Preety','Preety@g.com','Female', 'HR', 35000, 26,'Bangalore')
--INSERT INTO Employee_Assignment VALUES('Ramesh','Ramesh@g.com','Male','IT', 26000, 27,'Mumbai')
--INSERT INTO Employee_Assignment VALUES('Pramod','Pramod@g.com','Male','HR', 29000, 28,'Odisha')
--INSERT INTO Employee_Assignment VALUES('Anurag','Anurag@g.com','Male', 'Payroll', 27000, 26,'Odisha')
--INSERT INTO Employee_Assignment VALUES('Hina','Hina@g.com','Female','HR', 26000, 30,'Mumbai')
--INSERT INTO Employee_Assignment VALUES('Sambit','Sambit@g.com','Male','Payroll', 30000, 25,'Odisha')
--INSERT INTO Employee_Assignment VALUES('Manoj','Manoj@g.com','Male','HR', 30000, 28,'Odisha')
--INSERT INTO Employee_Assignment VALUES('Sara',' Sara@g.com','Female', 'Payroll', 28000, 27,'Mumbai')
--INSERT INTO Employee_Assignment VALUES('Lima','Lima@g.com','Female','HR', 30000, 30,'Bangalore')
--INSERT INTO Employee_Assignment VALUES('Dipak','Dipak@g.com','Male','Payroll', 32000, 25,'Bangalore')
--GO

-- Between Operator

--Select * from Employee_Assignment ema with(nolock) where ema.Age between 25 and 30

-- In operator

--Select * from Employee_Assignment ema with(nolock) where ema.Department in ('hr','payroll')
--Select * from Employee_Assignment ema with(nolock) where ema.Department not in ('hr')
--Select * from Employee_Assignment ema with(nolock) where ema.Department in (select ema.Department from Employee_Assignment emaa with(nolock))

-- Like Operator

--% symbol represents any no of characters in the expression.
--_ will represent a single character in the expression.
--The [] symbol indicates a set of characters in the expression.
--[^] will represent any single character, not within the specified range

--WAQ to display employee details whose name contains 5 characters.
--SELECT * FROM Employee_Assignment ema with(nolock) WHERE ema.Name LIKE '_____'

--WAQ to display employee details whose name contains ‘A’ character.
--SELECT  * FROM Employee_Assignment ema with(nolock) WHERE ema.Name LIKE '%A%'

--WAQ to display employee details whose name starts with ‘P’ character and ends with ‘A’ character.
--SELECT * FROM Employee_Assignment ema with(nolock) WHERE ema.Name LIKE 'P%A'

--WAQ to display employee details whose name starts with J, H, K, U characters.
--SELECT * FROM Employee_Assignment ema with(nolock) WHERE ema.Name LIKE'[J, H, K, U]%'

--WAQ to display employee details whose names start with A to Z characters.
--SELECT * FROM Employee_Assignment ema with(nolock) WHERE ema.Name LIKE'[A-Z]%'

--WAQ to display employee details whose name not start with A to Z characters.
--SELECT * FROM Employee_Assignment ema with(nolock) WHERE ema.Name LIKE'[^A-Z]%'


--CREATE TABLE PermanentEmployee
--(
--  EmployeeId INT,
--  Name VARCHAR(50),
--  Gender VARCHAR(50),
--  Department varchar(50),
--  Age INT
--)
--GO
----Insert Rows into PermanentEmployee Table
--INSERT INTO PermanentEmployee VALUES (1,'Pranaya','Male','IT',20)
--INSERT INTO PermanentEmployee VALUES (2,'Priyanka','Female','IT',22)
--INSERT INTO PermanentEmployee VALUES (3,'Sudhanshu','Male','HR',25)
--INSERT INTO PermanentEmployee VALUES (4,'Subrat','Male','Sales',60)
--INSERT INTO PermanentEmployee VALUES (5,'Tarun','Male','Sales',54)
--INSERT INTO PermanentEmployee VALUES (6,'Lipika','Female','HR',27)
--INSERT INTO PermanentEmployee VALUES (7,'Smita','Female','IT',40)
--INSERT INTO PermanentEmployee VALUES (8,'Smith','Male','HR',29)
--GO

---- Create ContractEmployee Table
--CREATE TABLE ContractEmployee
--(
--  EmployeeId INT,
--  Name VARCHAR(50),
--  Gender VARCHAR(50),
--  Department varchar(50),
--  Age INT
--)
--GO

----Insert rows into ContractEmployee Table
--INSERT INTO ContractEmployee VALUES (9,'Anurag','Male','IT',33)
--INSERT INTO ContractEmployee VALUES (10,'Sara','Female','IT',15)
--INSERT INTO ContractEmployee VALUES (11,'Sambit','Male','HR',29)
--INSERT INTO ContractEmployee VALUES (12,'James','Male','Sales',37)
--INSERT INTO ContractEmployee VALUES (13,'Pam','Female','Sales',25)
--GO

--All Operatore

--The ALL Operator in SQL Server can only be used with WHERE and HAVING clauses.

--SELECT * FROM PermanentEmployee WHERE Age > (SELECT MAX(AGE) FROM ContractEmployee)

--For the above requirement, we can also use the ALL logical operator. In that case, we don’t have to use the Max function.
--The ALL Operator is going to compare our outer query value to a set of values from the subquery. 
--We can use >All, Greater than ALL means greater than every value returned by the subquery, In other words, greater than max value.

--SELECT * FROM PermanentEmployee WHERE Age > ALL (SELECT AGE FROM ContractEmployee)

--CREATE TABLE #TEMP_TABLE (ID INT)
 
--INSERT INTO #TEMP_TABLE VALUES(1)
--INSERT INTO #TEMP_TABLE VALUES(2)
--INSERT INTO #TEMP_TABLE VALUES(3)

--IF 4 > ALL (SELECT ID FROM #TEMP_TABLE)
--      PRINT 'Returned True'
--ELSE
--      PRINT 'Returned False'

--IF 3 > ALL (SELECT ID FROM #TEMP_TABLE)
--     PRINT 'Returned True'
--ELSE
--     PRINT 'Returned False'

-- Any Operator
-- The ANY Operator in SQL Server is used to compare a value to each value in a list of results from a query and evaluate to true
-- if the result of an inner query contains at least one row.
-- ANY must match at least one row in the subquery and must be preceded by comparison operators.

--SELECT * FROM PermanentEmployee WHERE Age > ANY (SELECT Age FROM ContractEmployee)

-- Some operator same as any
--SELECT * FROM PermanentEmployee WHERE Age > SOME (SELECT Age FROM ContractEmployee)

-- Exists Operator

--The SQL Server EXISTS operator is used in combination with a subquery and is considered to be met 
--if the subquery returns at least one row. It can be used in a SELECT, INSERT, UPDATE, or DELETE statement.

--The EXISTS operator is used to checks the existence of a result of a subquery. 
--Generally, we use this EXISTS operator in WHERE clause to check whether subquery is returning results or not.
--The EXISTS subquery tests whether a subquery fetches at least one-row or not.
--When no data is returned then this operator returns ‘FALSE’. 

--CREATE TABLE EmployeeDetails
--(
--  ID INT, 
--  Name VARCHAR(50),
--  Gender VARCHAR(10),
--  Department VARCHAR(50),
--  Salary INT,
--  Location VARCHAR(50)
--)
--GO
 
--INSERT INTO EmployeeDetails VALUES(1, 'Pranaya', 'Male','IT', 25000, 'Mumbai')
--INSERT INTO EmployeeDetails VALUES(2, 'Anurag', 'Male','HR', 15000, 'Mumbai')
--INSERT INTO EmployeeDetails VALUES(3, 'Priyanka', 'Female','IT', 50000, 'Hyderabad')
--INSERT INTO EmployeeDetails VALUES(4, 'Preety', 'Female','IT', 75000, 'Delhi')
--INSERT INTO EmployeeDetails VALUES(5, 'Subrat', 'Male','HR', 65000, 'Delhi')
--INSERT INTO EmployeeDetails VALUES(6, 'Hina', 'Female','Sales', 55000, 'Hyderabad')
--INSERT INTO EmployeeDetails VALUES(7, 'Sushanta', 'Male','Sales', 20000, 'Delhi')
--GO

--CREATE TABLE EmployeeContactDetails
--(
--  ID INT, 
--  EmployeeID VARCHAR(50),
--  Email VARCHAR(50),
--  Mobile VARCHAR(10),
--  PinCode VARCHAR(20)
--)
--GO
 
--INSERT INTO EmployeeContactDetails VALUES(1,1, 'Pranaya@g.com', '1111111111', '755019')
--INSERT INTO EmployeeContactDetails VALUES(2,2, 'Anurag@g.com', '2222222222', '755020')
--INSERT INTO EmployeeContactDetails VALUES(3,5, 'Priyanka@g.com', '3333333333', '755030')
--INSERT INTO EmployeeContactDetails VALUES(4,6, 'Preety@g.com', '4444444444', '755040')
--GO



--SELECT *
--FROM EmployeeDetails ed with(nolock)
--WHERE  EXISTS (SELECT *
--              FROM EmployeeContactDetails ecd with(nolock)
--              WHERE ed.ID = ecd.EmployeeID);

--SELECT *
--FROM EmployeeDetails ed with(nolock)
--WHERE  EXISTS (SELECT 1
--              FROM EmployeeContactDetails ecd with(nolock)
--              WHERE ed.ID = ecd.EmployeeID);

-- Union ,Union All,Intersect and Except - Set Operator
--UNION: Combine two or more result sets into a single set, without duplicates.
--UNION ALL: Combine two or more result sets into a single set, including all duplicates.
--INTERSECT: Takes the data from both result sets which are in common.
--EXCEPT: Takes the data from the first result set, but not in the second result set (i.e. no matching to each other)

--Points to Remember while working with Set Operations:

--The result sets of all queries must have the same number of columns.
--In every result set the data type of each column must be compatible (well-matched) to the data type of its corresponding column in other result sets.
--In order to sort the result, an ORDER BY clause should be part of the last select statement. 
--The column names or aliases must be found out by the first select statement.

--CREATE TABLE EmployeeIndia
--(
--  ID INT PRIMARY KEY,
--  Name VARCHAR(50),
--  Gender VARCHAR(10),
--  Department VARCHAR(50)
--)
--GO

--INSERT INTO EmployeeIndia VALUES(1, 'Pranaya', 'Male','IT')
--INSERT INTO EmployeeIndia VALUES(2, 'Priyanka', 'Female','IT')
--INSERT INTO EmployeeIndia VALUES(3, 'Preety', 'Female','HR')
--INSERT INTO EmployeeIndia VALUES(4, 'Subrat', 'Male','HR')
--INSERT INTO EmployeeIndia VALUES(5, 'Anurag', 'Male','IT')
--GO

--CREATE TABLE EmployeeUK
--(
--  ID INT PRIMARY KEY,
--  Name VARCHAR(50),
--  Gender VARCHAR(10),
--  Department VARCHAR(50)
--)
--GO

--INSERT INTO EmployeeUK VALUES(1, 'James', 'Male','IT')
--INSERT INTO EmployeeUK VALUES(2, 'Priyanka', 'Female','IT')
--INSERT INTO EmployeeUK VALUES(3, 'Sara', 'Female','HR')
--INSERT INTO EmployeeUK VALUES(4, 'Subrat', 'Male','HR')
--INSERT INTO EmployeeUK VALUES(5, 'Pam', 'Female','HR')
--GO

--SELECT ID, Name, Gender, Department FROM EmployeeIndia with(nolock)
--UNION ALL
--Select ID, Name, Gender, Department FROM EmployeeUK with(nolock)

--SELECT ID, Name, Gender, Department FROM EmployeeIndia with(nolock)
----order by Id desc not working
----where Name like '[a-z]%'
--UNION ALL
--Select ID, Name, Gender, Department FROM EmployeeUK with(nolock)
----where Name not like '[a-z]%'
----order by Id desc -- working

--SELECT  Gender,Count(*) as 'Rpws' FROM EmployeeIndia with(nolock)
--UNION ALL
--Select Gender ,Count(*) as 'Rpws' FROM EmployeeUK with(nolock)
----group by Gender not working

--SELECT ID, Name, Gender, Department FROM EmployeeIndia
--UNION
--SELECT ID, Name, Gender, Department FROM EmployeeUK
--ORDER BY Name

--SELECT ID, Name, Gender, Department FROM EmployeeIndia
--EXCEPT
--SELECT ID, Name, Gender, Department FROM EmployeeUK
--Order by name

--SELECT ID, Name, Gender, Department FROM EmployeeIndia
--INTERSECT
--SELECT ID, Name, Gender, Department FROM EmployeeUK
--Order by name
