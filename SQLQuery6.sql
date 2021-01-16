--Join Topic

--Cross or Cartisian Join (every row in the Left Table is joined to every row in the Right Table)
--Cross Join does not have an ON clause with a Join condition

--CREATE TABLE Company
--(
--    CompanyId TinyInt Identity Primary Key,
--    CompanyName Nvarchar(50) NULL
--)
--GO

--INSERT Company VALUES('DELL')
--INSERT Company VALUES('HP')
--INSERT Company VALUES('IBM')
--INSERT Company VALUES('Microsoft')
--GO

--CREATE TABLE Candidate
--(
--    CandidateId tinyint identity primary key,
--    FullName nvarchar(50) NULL,
--    CompanyId tinyint REFERENCES Company(CompanyId)
--)
--GO

--INSERT Candidate VALUES('Ron',1)
--INSERT Candidate VALUES('Pete',2)
--INSERT Candidate VALUES('Steve',3)
--INSERT Candidate VALUES('Steve',NULL)
--INSERT Candidate VALUES('Ravi',1)
--INSERT Candidate VALUES('Raj',3)
--INSERT Candidate VALUES('Kiran',NULL)
--GO

--SELECT  Cand.CandidateId,
--  Cand.FullName,
--  Cand.CompanyId, 
--  Comp.CompanyId,
--        Comp.CompanyName
--FROM Candidate Cand
--CROSS JOIN Company Comp --on Cand.CompanyId=Comp.CompanyId
----Where Cand.CandidateId=7
----Order by Cand.FullName 

-- Inner Join 

--SELECT  Cand.CandidateId, 
--  Cand.FullName, 
--  Cand.CompanyId, 
--  Comp.CompanyId, 
--  Comp.CompanyName
--FROM Candidate Cand
--INNER JOIN Company Comp
--ON Cand.CompanyId = Comp.CompanyId

-- Left Join

--SELECT  Cand.CandidateId, 
--  Cand.FullName, 
--  Cand.CompanyId, 
--  Comp.CompanyId, 
--  Comp.CompanyName
--FROM Candidate Cand
--LEFT JOIN Company Comp
--ON Cand.CompanyId = Comp.CompanyId

-- right Join

--SELECT  Cand.CandidateId, 
--  Cand.FullName, 
--  Cand.CompanyId, 
--  Comp.CompanyId, 
--  Comp.CompanyName
--FROM Candidate Cand
--RIGHT JOIN Company Comp
--ON Cand.CompanyId = Comp.CompanyId

-- full Join

--SELECT  Cand.CandidateId, 
--  Cand.FullName, 
--  Cand.CompanyId, 
--  Comp.CompanyId, 
--  Comp.CompanyName
--FROM Candidate Cand
--FULL JOIN Company Comp
--ON Cand.CompanyId = Comp.CompanyId



--Selg Join (Self Join is nothing a concept where we need to join a table by itself.
--You need to use SQL Server Self Join when you have some relations between the columns of the same table.)

-- Create the Employee_Self table
--CREATE TABLE Employee_SelfJoin
--(
--  EmployeeID INT Primary Key,
--  Name VARCHAR(20),
--  ManagerID INT
--)
--GO
---- Insert the following records
--INSERT INTO Employee_SelfJoin VALUES(1, 'Pranaya', 3)
--INSERT INTO Employee_SelfJoin VALUES(2, 'Priyanka', 1)
--INSERT INTO Employee_SelfJoin VALUES(3, 'Preety', NULL)
--INSERT INTO Employee_SelfJoin VALUES(4, 'Anurag', 1)
--INSERT INTO Employee_SelfJoin VALUES(5, 'Sambit', 1)
--GO

--SELECT E.Name as Employee, M.Name as Manager
--FROM Employee_SelfJoin E
--LEFT JOIN Employee_SelfJoin M
--ON E.ManagerId = M.EmployeeId

--SELECT E.Name as Employee, M.Name as Manager
--FROM Employee_SelfJoin E
--INNER JOIN Employee_SelfJoin M
--ON E.ManagerId = M.EmployeeId

--SELECT E.Name as Employee, M.Name as Manager
--FROM Employee_SelfJoin E
--CROSS JOIN Employee_SelfJoin M

