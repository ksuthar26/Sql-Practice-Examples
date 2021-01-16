-- SQL Server Scalar Functions
--The functions which return only a single value (scalar value) from the table is known as scalar value function. Scalar value functions may or may not have parameters which are optional,
--but always return a single (scalar) value which is mandatory.
--The returned value which is return by the SQL Server Scalar Function can be of any data type, except text, ntext, image, cursor, and timestamp.


--CREATE FUNCTION SVF1(@X INT)
--RETURNS INT
--AS
--BEGIN
--  RETURN @X * @X *@X
--END

--SELECT dbo.SVF1(5)

--CREATE FUNCTION CalculateAge
--(
--  @DOB DATE
--)
--RETURNS INT
--AS
--BEGIN
--  DECLARE @AGE INT
--  SET @AGE = DATEDIFF(YEAR, @DOB, GETDATE())-
--  CASE
--    WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR
--       (MONTH(@DOB) = MONTH(GETDATE()) AND
--        DAY(@DOB) > DAY(GETDATE()))
--    THEN 1
--    ELSE 0
--  END
--  RETURN @AGE
--END

--SELECT dbo.CalculateAge ('02/29/1988') As Age

--NOTE: The User Defined SQL Server Scalar Function can also be used in the select clause of an SQL Query.

--If you want to alter the function then you need to use ALTER FUNCTION FuncationName statement and to delete the function, you need to use DROP FUNCTION FuncationName.

--To view the text of the user-defined function use sp_helptext FunctionName

--Inline Table Valued Function
--In case of Inline Table Valued Function, the body of the function will have only a single select statement prepared with “RETURN” statement.

--Points to Remember:
--We specify Table as the return type instead of any scalar data type.
--The function body is not closed between BEGIN and END block.’
--The structure of the table that gets returned is determined by the select statement within the function.

--CREATE FUNCTION FN_GetStudentDetailsByID
--(
--  @ID INT
--)
--RETURNS TABLE
--AS
--RETURN (SELECT * FROM Employee_Mvf WHERE ID = @ID)

-- Calling the Function:
--SELECT * FROM FN_GetStudentDetailsByID(1)

--Multi-Statement Table Valued Function

--The Multi-Statement Table Valued Function in SQL Server is same as the Inline Table values Function in SQL Server means it also return a table as an output but with the following differences.

--Multi-Statement Table-Valued Function body can contain more than one statement.
--The structure of the table is returned from the function can be defined by us.

--NOTE: In case Multi-Statement Table Valued Function in SQL Server we need to define the structure of the table being return.

-- Create Department_Mvf Table
--CREATE TABLE Department_Mvf
--(
--  ID INT PRIMARY KEY,
--  Department_MvfName VARCHAR(50)
--)
--GO

---- Populate the Department_Mvf Table with test data
--INSERT INTO Department_Mvf VALUES(1, 'IT')
--INSERT INTO Department_Mvf VALUES(2, 'HR')
--INSERT INTO Department_Mvf VALUES(3, 'Sales')
--GO

---- Create Employee_Mvf Table
--CREATE TABLE Employee_Mvf
--(
--  ID INT PRIMARY KEY,
--  Name VARCHAR(50),
--  Gender VARCHAR(50),
--  DOB DATETIME,
--  DeptID INT FOREIGN KEY REFERENCES Department_Mvf(ID) 
--)
--GO

---- Populate the Employee_Mvf Table with test data
--INSERT INTO Employee_Mvf VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
--INSERT INTO Employee_Mvf VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
--INSERT INTO Employee_Mvf VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
--INSERT INTO Employee_Mvf VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
--INSERT INTO Employee_Mvf VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
--INSERT INTO Employee_Mvf VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
--GO


-- Inline Table Valued function:
--CREATE FUNCTION ILTVF_GetEmployees()
--RETURNS Table
--AS
--RETURN (SELECT ID, Name, Cast(DOB AS Date) AS DOB
--        FROM Employee_Mvf)

-- Multi-statement Table Valued function:
--CREATE FUNCTION MSTVF_GetEmployees()
--RETURNS @Table Table (ID int, Name nvarchar(20), DOB Date)
--AS
--BEGIN
--  INSERT INTO @Table
--    SELECT ID, Name, Cast(DOB AS Date)
--    FROM Employee_Mvf
--  Return
--End

-- Calling the Inline Table Valued Function:
--SELECT * FROM ILTVF_GetEmployees()

-- Calling the Multi-statement Table Valued Function:
--SELECT * FROM MSTVF_GetEmployees()

--UPDATE ILTVF_GetEmployees() SET Name='Pranaya1' WHERE ID= 1


--What are the differences between Inline and multi-statement Table-valued function?
--In an Inline Table Valued Function, the returns clause cannot contain the structure of the table that the function is going to return whereas in multi-statement table valued function we can define the structure of the table that the function is going to return.
--The Inline table value function cannot have BEGIN and END blocks whereas the multi-statement function can have the Begin and End blocks.

--Inline table-valued functions are better for performance than multi-statement table valued function. So, if the given task can be achieved using an inline table-valued function,
--then it always preferred to use Inline Table-valued Function over the multi-statement table valued function.

--Reason For Better Performance: Internally SQL Server treats an Inline table-valued function much like a view and treats a multi-statement table valued function as a stored procedure.

--It is possible to update the underlying database table using the inline table-valued function but it is not possible to update the underlying database table using the multi-statement table valued function.

--What is the difference between functions and procedures?
--A function must return a value whereas a procedure never returns a value.
--The procedure can have parameters of both input and output whereas a function can have only input parameters.
--In a procedure, we can perform Select. Update, insert and delete operations whereas function can only be used to perform select operations. It cannot be used to perform insert, update and delete operations that can change the state of the database.
--A procedure provides the options to perform transaction management, error handling, etc whereas these operations are not possible in a function.
--We call a procedure using EXECUTE/ EXEC command whereas a function is called by using SELECT command only.
--From a procedure, we can call another procedure or a function whereas from a function we can call another function but not a procedure.
--UDF can be used in the SQL statements anywhere in the WHERE/HAVING/SELECT section where as Stored procedures cannot be.