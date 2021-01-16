
-- Built In Function

--1.ASCII(Character_Expresssion)

-- Select ASCII('A')

-- Select ASCII('A') as UpperCase, ASCII('a') as LowerCase

--2.CHAR(Integer_Expression) - CHAR function does the opposite of ASCII function

--DECLARE @Number int
--SET @Number = 65
--WHILE(@Number <= 90)
--BEGIN
--  PRINT CHAR(@Number)
--  SET @Number = @Number + 1
--END

--DECLARE @Number int
--SET @Number = 65
--WHILE(@Number <= 90)
--BEGIN
--  PRINT LOWER(CHAR(@Number))
--  SET @Number = @Number + 1
--END

--2.LTRIM/RTRIM

--Select LTRIM(RTRIM('   Hello   '))

--3.LOWER/UPPER

--Select LOWER('CONVERT This String Into Lower Case')
--Select UPPER('CONVERT This String Into Lower Case')

--4.REVERSE

-- Select REVERSE('ABCDEFGHIJKLMNOPQRSTUVWXYZ')

--5.LEN(String_Expression) -- This function returns the number of characters, instead of the number of bytes, of the specified string expression, excluding trailing blanks.
                           -- That means it returns the count of total characters in the given string expression, excluding the blanks at the end of the expression.

-- Select LEN(' Functions ')

--6 LEFT(Character_Expression, Integer_Expression)/RIGHT(Character_Expression, Integer_Expression)

-- Select LEFT('ABCDE', 13)
-- Select RIGHT('ABCDE', 4)

--7 CHARINDEX(‘Expression_To_Find’, ‘Expression_To_Search’, ‘Start_Location’) -This function returns the starting position of the specified expression in a character string. Start_Location parameter is optional.

-- Select CHARINDEX('@','hina@aaa.com',3)
-- Select CHARINDEX('@','hina@aaa.com',6)

--8 SUBSTRING(‘expression’, ‘Start’, ‘Length’) --As the name, suggests, this function returns substring (part of the string), from the given expression. 
                                               --You specify the starting location using the ‘start’ parameter and the number of characters in the substring using the ‘Length’ parameter. All the 3 parameters are mandatory.

--	Select SUBSTRING('info@dotnettutorials.net',-1, 5)

--Select SUBSTRING('info@dotnettutorials.net',(CHARINDEX('@', 'info@dotnettutorials.net') + 1),(LEN('info@dotnettutorials.net') - CHARINDEX('@','info@dotnettutorials.net')))


--OVER Clause

--CREATE TABLE Employee_OVER
--(
--     ID INT,
--     Name VARCHAR(50),
--     Department VARCHAR(50),
--     Salary int
--)
--Go

--INSERT INTO Employee_OVER Values (1, 'James', 'IT', 15000)
--INSERT INTO Employee_OVER Values (2, 'Smith', 'IT', 35000)
--INSERT INTO Employee_OVER Values (3, 'Rasol', 'HR', 15000)
--INSERT INTO Employee_OVER Values (4, 'Rakesh', 'Payroll', 35000)
--INSERT INTO Employee_OVER Values (5, 'Pam', 'IT', 42000)
--INSERT INTO Employee_OVER Values (6, 'Stokes', 'HR', 15000)
--INSERT INTO Employee_OVER Values (7, 'Taylor', 'HR', 67000)
--INSERT INTO Employee_OVER Values (8, 'Preety', 'Payroll', 67000)
--INSERT INTO Employee_OVER Values (9, 'Priyanka', 'Payroll', 55000)
--INSERT INTO Employee_OVER Values (10, 'Anurag', 'Payroll', 15000)
--INSERT INTO Employee_OVER Values (11, 'Marshal', 'HR', 55000)
--INSERT INTO Employee_OVER Values (12, 'David', 'IT', 96000)

--SELECT  Department, 
-- COUNT(*) AS NoOfEmployees, 
-- SUM(Salary) AS TotalSalary,
-- AVG(Salary) AS AvgSalary,
-- MIN(Salary) AS MinSalary, 
-- MAX(Salary) AS MaxSalary
--FROM Employee_OVER
--GROUP BY Department

--solution 1

--SELECT Name, Salary, Employee_OVER.Department, 
--  Departments.DepartmentTotals,
--  Departments.TotalSalary, 
--  Departments.AvgSalary, 
--  Departments.MinSalary, 
--  Departments.MaxSalary   
--FROM  Employee_OVER
--INNER JOIN
--( SELECT Department, COUNT(*) AS DepartmentTotals,
--  SUM(Salary) AS TotalSalary,
--  AVG(Salary) AS AvgSalary,
--  MIN(Salary) AS MinSalary, 
--  MAX(Salary) AS MaxSalary
-- FROM Employee_OVER
-- GROUP BY Department) AS Departments
--ON Departments.Department = Employee_OVER.Department

-- solution 2

--SELECT  Name, 
-- Salary, 
-- Department,
-- COUNT(Department) OVER(PARTITION BY Department) AS DepartmentTotals,
-- SUM(Salary) OVER(PARTITION BY Department) AS TotalSalary,
-- AVG(Salary) OVER(PARTITION BY Department) AS AvgSalary,
-- MIN(Salary) OVER(PARTITION BY Department) AS MinSalary,
-- MAX(Salary) OVER(PARTITION BY Department) AS MaxSalary
--FROM Employee_OVER

--ROW_NUMBER FUNCTION

--SELECT Name, Department, Salary,
--ROW_NUMBER() OVER (ORDER BY Department DESC,nAME ASC,SALARY DESC) AS RowNumber
--FROM Employee_OVER

--SELECT Name, Department, Salary,
--ROW_NUMBER() OVER (ORDER BY Department) AS RowNumber
--FROM Employee_OVER

--SELECT Name, Department, Salary,
--        ROW_NUMBER() OVER 
-- (
--            PARTITION BY Department
--     ORDER BY Name
-- ) AS RowNumber
--FROM Employee_OVER

--INSERT INTO Employee_OVER Values (1, 'James', 'IT', 15000)
--INSERT INTO Employee_OVER Values (1, 'James', 'IT', 15000)
--INSERT INTO Employee_OVER Values (2, 'Rasol', 'HR', 15000)
--INSERT INTO Employee_OVER Values (2, 'Rasol', 'HR', 15000)
--INSERT INTO Employee_OVER Values (2, 'Rasol', 'HR', 15000)
--INSERT INTO Employee_OVER Values (3, 'Stokes', 'HR', 15000)
--INSERT INTO Employee_OVER Values (3, 'Stokes', 'HR', 15000)
--INSERT INTO Employee_OVER Values (3, 'Stokes', 'HR', 15000)
--INSERT INTO Employee_OVER Values (3, 'Stokes', 'HR', 15000)


--WITH DeleteDuplicateCTE AS
--(
--     SELECT *, ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID) AS RowNumber
--     FROM Employee_OVER
--)
--SELECT * FROM DeleteDuplicateCTE
----DELETE FROM DeleteDuplicateCTE WHERE RowNumber > 1

--RANK AND DENSE_RANK

--SELECT Name, Department, Salary,
--               RANK() OVER (
--                               PARTITION BY Department
--                               ORDER BY Salary ASC) AS [Rank]
--FROM Employee_OVER

--SELECT Name, Department, Salary,
--            DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary ASC) AS [Rank]
--FROM Employee_OVER

--Fetch the 2nd Highest Salary using the RANK function:

-- Fetch the 2nd Hight Salary
--WITH EmployeeCTE  AS
--(
--    SELECT Salary, RANK() OVER (ORDER BY Salary DESC) AS Rank_Salry
--    FROM Employee_OVER
--)
----SELECT *  FROM EmployeeCTE
--SELECT TOP 1 Salary FROM EmployeeCTE WHERE Rank_Salry = 2

--WITH EmployeeCTE  AS
--(
--    SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS Rank_Salry
--    FROM Employee_OVER
--)
----SELECT *  FROM EmployeeCTE
--SELECT TOP 1 Salary FROM EmployeeCTE WHERE Rank_Salry = 2

-- find the Highest Salary Department wise:

--WITH EmployeeCTE  AS
--(
--    SELECT Salary, Department,
--           DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC)
--           AS Salary_Rank
--    FROM Employee_OVER
--)

--SELECT TOP 1 Salary FROM EmployeeCTE WHERE Salary_Rank = 3
--AND Department = 'IT'





