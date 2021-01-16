--CREATE PROCEDURE spGetEmployee_Sp
--As
--BEGIN
--  SELECT Name,Gender, DOB FROM Employee_Sp
--END

-- How to change the body of a stored procedure
-- User Alter procedure to change the body
--ALTER PROCEDURE spGetEmployee_Sp
--AS
--BEGIN
--  SELECT *
--  FROM Employee_Sp 
--  ORDER BY ID
--END

--sp_helptext spGetEmployee_Sp

-- To change the procedure name from spGetEmployee_Sp to spGetEmployee_Sp1
-- Use sp_rename system defined stored procedure
--EXEC sp_rename 'spGetEmployee_Sp', 'spGetEmployee_Sp1'

--Drop proc spGetEmployee_Sp1 
--Drop Procedure spGetEmployee_Sp1

-- Create a Procedure
--CREATE OR ALTER PROCEDURE spAddTwoNumbers(@no1 INT, @no2 INT)
--AS
--BEGIN
--  DECLARE @Result INT
--  SET @Result = @no1 + @no2
--  PRINT 'RESULT IS: '+ CAST(@Result AS VARCHAR)
--END
--GO

-- Calling the procedure:
--EXECUTE spAddTwoNumbers 10, 20

---- OR 
--EXECUTE spAddTwoNumbers @no1=10, @no2=20

---- OR calling the procedure by declaring two variables as shown below
--DECLARE @no1 INT, @no2 INt
--SET @no1 = 10
--SET @no2 = 20
--EXECUTE spAddTwoNumbers @no1, @no2

--Note: The Parameters and variables that we created must have an @ prefix in their name.

-- Create Employee_Sp Table
--CREATE TABLE Employee_Sp
--(
--  ID INT PRIMARY KEY,
--  Name VARCHAR(50),
--  Gender VARCHAR(50),
--  DOB DATETIME,
--  DeptID INT
--)
--GO

---- Populate the Employee_Sp Table with test data
--INSERT INTO Employee_Sp VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
--INSERT INTO Employee_Sp VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
--INSERT INTO Employee_Sp VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
--INSERT INTO Employee_Sp VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
--INSERT INTO Employee_Sp VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
--INSERT INTO Employee_Sp VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
--GO

--CREATE PROCEDURE spGetEmployeesByGenderAndDepartment
--  @Gender VARCHAR(20),
--  @DeptID INT
--AS
--BEGIN
--  SELECT Name, Gender, DOB, DeptID 
--  FROM Employee_sp
--  WHERE Gender = @Gender AND DeptID = @DeptID
--END
--GO

--EXECUTE spGetEmployeesByGenderAndDepartment 'Male', 1
--spGetEmployeesByGenderAndDepartment 'Male', 1

--EXEC spGetEmployeesByGenderAndDepartment @DeptID=1, @Gender='Male'
--EXEC spGetEmployeesByGenderAndDepartment @Gender='Male', @DeptID=1

--EXEC spGetEmployeesByGenderAndDepartment 1, 'Male' -- On the other hand, if we change the order, then we will get an error stating “Error converting data type varchar to int.” This is because the value of “Male” is passed into the @DeptID parameter

--NOTE: While we are calling the stored procedure passing the values in the order is very important. 
--In the order they are declared in the procedure we need to pass the values in the same order. You can also pass the value in any order, 
--but at that time you have to specify the variable name before the value to which you are passing the values.
-- Create a Procedure


--CREATE PROCEDURE spUpdateEmployeeByID
--(
--  @ID INT, 
--  @Name VARCHAR(50), 
--  @Gender VARCHAR(50), 
--  @DOB DATETIME, 
--  @DeptID INT
--)
--AS
--BEGIN
--  UPDATE Employee_sp SET 
--      Name = @Name, 
--      Gender = @Gender,
--      DOB = @DOB, 
--      DeptID = @DeptID
--  WHERE ID = @ID
--END
--GO

-- Executing the Procedure
-- If you are not specifying the Parameter Names then the order is important
--EXECUTE spUpdateEmployeeByID 3, 'Palak', 'Female', '1994-06-17 10:53:27.060', 3

-- If you are specifying the Parameter Names then order is not mandatory
--EXECUTE spUpdateEmployeeByID @ID =3, @Gender = 'Female', @DOB = '1994-06-17 10:53:27.060', @DeptID = 3, @Name = 'Palak'

--The Output parameter in SQL Server can be declared either by using the OUT or OUTPUT keyword

--CREATE PROCEDURE spGetResult
--  @No1 INT,
--  @No2 INT,
--  @Result INT OUTPUT
--AS
--BEGIN
--  SET @Result = @No1 + @No2
--END

-- To Execute Procedure
--DECLARE @Result INT
--EXECUTE spGetResult 10, 20, @Result OUT
--PRINT @Result

--CREATE PROCEDURE spGetEmployeeCountByGender
--  @Gender VARCHAR(30),
--  @EmployeeCount INT OUTPUT
--AS
--BEGIN
--  SELECT @EmployeeCount = COUNT(ID)
--  FROM    Employee_sp
--  WHERE     Gender = @Gender
--END

-- Way 1

--DECLARE @EmployeeTotal INT
--EXECUTE spGetEmployeeCountByGender 'Male', @EmployeeTotal OUTPUT
--PRINT @EmployeeTotal

--NOTE: If we don’t specify the output keyword when executing the stored procedure then the @EmployeeTotal value will be null. For example, see the following

--DECLARE @EmployeeTotal INT
--EXECUTE spGetEmployeeCountByGender 'Male', @EmployeeTotal
--PRINT @EmployeeTotal

--DECLARE @EmployeeTotal INT
--EXECUTE spGetEmployeeCountByGender'Male', @EmployeeTotal
--IF (@EmployeeTotal IS NULL)
--  PRINT '@EmployeeTotal IS NULL'
--ELSE
--  PRINT '@EmployeeTotal IS NOT NULL'

--Way2: Not Allowed

--DECLARE @EmployeeTotal INT
--EXECUTE spGetEmployeeCountByGender @EmployeeTotal OUTPUT, 'Male'
--PRINT @EmployeeTotal

--Way3: Allowed

--DECLARE @EmployeeTotal INT
--EXECUTE spGetEmployeeCountByGender @EmployeeCount = @EmployeeTotal OUTPUT, @Gender ='Male'
--PRINT @EmployeeTotal

--CREATE OR ALTER PROCEDURE spGetTotalCountOfEmployee1
--  @TotalCount INT OUTPUT
--AS
--BEGIN
--  SELECT @TotalCount =COUNT(ID) FROM Employee_Sp
--END

---- For calling the procedure:
--DECLARE @EmployeeTotal INT
--EXECUTE spGetTotalCountOfEmployee1 @EmployeeTotal OUTPUT
--PRINT @EmployeeTotal


--CREATE PROCEDURE spGetTotalCountOfEmployee2
--AS
--BEGIN
--  RETURN (SELECT COUNT(ID) FROM Employee_SP)
--END

-- For calling the procedure:
--DECLARE @EmployeeTotal INT
--EXECUTE @EmployeeTotal = spGetTotalCountOfEmployee2
--PRINT @EmployeeTotal

--CREATE PROCEDURE spGetEmplloyeeNameById2
--  @ID INT
--AS
--BEGIN
--  RETURN (SELECT Name FROM Employee_sp WHERE ID = @ID)
--END
--GO

-- For calling the procedure:
--DECLARE @EmployeeName VARCHAR(30)
--EXECUTE @EmployeeName = spGetEmplloyeeNameById2 3
--PRINT @EmployeeName

--When we execute the spGetEmplloyeeNameById2 Stored Procedure it returns an error stating ‘Conversion failed when converting the nvarchar value Anurag to data type int.‘.
--The return status variable is an integer, and hence when we select the Name of an employee and try to return that we get a conversion error. 

--So, in SQL Server by using the return values, we can return only one integer. 
--It is not possible, to return more than one value using return values, whereas output parameters, we can return any data type and a stored procedure can have more than one output parameters.


-- Private/Local Temporary Stored Procedure

--CREATE PROCEDURE #LocalProcedure
--AS
--BEGIN
--  PRINT 'This is Local Temporary Procedure'
--END

---- Calling the Local Temporary Procedure
--EXEC #LocalProcedue

--Public/Global Temporary Stored Procedure.

--CREATE PROCEDURE ##GlobalProcedue
--AS
--BEGIN
--  PRINT 'This is Global Temporary Procedure'
--END

---- Calling the Global Temporary Procedure
--EXEC ##GlobalProcedue

--Stored Procedure with Default Values:

--CREATE OR ALTER PROCEDURE spAddNumber(@No1 INT= 100, @No2 INT)
--AS
--BEGIN
--  DECLARE @Result INT
--  SET @Result = @No1 + @No2
--  PRINT 'The SUM of the 2 Numbers is: '+ CAST(@Result AS VARCHAR)
--END

-- Executing the above procedure:
-- EXEC spAddNumber 3200, 25
-- EXEC spAddNumber @No1=200, @No2=25
-- EXEC spAddNumber @No1=DEFAULT, @No2=25
-- EXEC spAddNumber @No2=25

--sp_help procedure name:
--This sp_help system-defined stored procedure is used to view the information of a stored procedure like parameter names, their data type, etc.
-- The Sp_help stored procedure not only used to give information about a stored procedure but also give information about other database objects like tables, views, triggers, etc.
--You can also press the ALT+F1 key to get the information when the name of the object is highlighted.

--Example:
--sp_help spGetEmployeeCountByGender
--sp_help Employee

--Sp_depends procedure name:
--The sp_depends system-defined stored procedure is used when we want to see the dependency object of a stored procedure. 
--This procedure is very useful when we want to check if there are any stored procedures that are referencing a table that we are going to drop.
--The Sp_depends system-defined stored procedure can also be used with other database objects like table, view, etc.

--sp_depends spGetEmployee -- it gives information on which fields of which table it depends

--sp_depends Employee_sP -- It gives information about the functions, procedures etc which depends on this table

--With Encryption Attribute -- f this With Encryption attribute is used while creating the stored procedure, then the text or content of the stored procedure is encrypted and will not be stored in the text column of the syscomments system table.
--As a result, we cannot view the text of the stored procedure.

-- Stored Procedure without with encryption option
--CREATE Procedure sp_GetEmployeeDetailsById
--(
--  @ID INT
--)
--AS
--BEGIN
--  SELECT Name, Gender, CAST(DOB AS DATE) AS DOB 
--  FROM Employee_SP 
--  WHERE ID = @ID
--END

-- SELECT * FROM SYSCOMMENTS WHERE ID = OBJECT_ID('sp_GetEmployeeDetailsById')

--sp_helptext sp_GetEmployeeDetailsById

-- Stored Procedure with encryption option
--ALTER Procedure sp_GetEmployeeDetailsById
--(
--  @ID INT
--)
--WITH ENCRYPTION
--AS
--BEGIN
--  SELECT Name, Gender, CAST(DOB AS DATE) AS DOB 
--  FROM Employee_sP 
--  WHERE ID = @ID
--END

--SELECT * FROM SYSCOMMENTS WHERE ID = OBJECT_ID('sp_GetEmployeeDetailsById')

--sp_helptext sp_GetEmployeeDetailsById

--With Recompiled Attribute

--Forcing a procedure for recompilation and prepared the query plan is required when the database undergoes significant changes to its data or structure.

--Another reason to force a procedure to recompile is if at all the tables is added with new indexes from which the procedure might be benefited forcing for recompilation is very important because we cannot wait until the server is restarted for preparing a new query plan.

--Note: Even if the “Recompile“ Attribute is available it is not suggested to be used if at all there are no significant changes in the structure of the databases.

--ALTER Procedure sp_GetEmployeeDetailsById
--(
--  @ID INT
--)
--WITH RECOMPILE
--AS
--BEGIN
--  SELECT Name, Gender, CAST(DOB AS DATE) AS DOB 
--  FROM Employee_Sp 
--  WHERE ID = @ID
--END
