--SELECT [ ALL | DISTINCT ]
--[TOP (top_value) [ PERCENT ] [ WITH TIES ] ]
--expressions
--FROM tables
--[WHERE conditions]
--[GROUP BY expressions]
--[HAVING condition]
--[ORDER BY expression [ ASC | DESC ]];

--Create Gender1 table
--CREATE TABLE Gender1
--(
--  ID INT PRIMARY KEY IDENTITY(1,1),
--  Gender1 VARCHAR(50)
--)
--GO

---- Create Person1 table
--CREATE TABLE Person1
--(
--  ID INT PRIMARY KEY IDENTITY(1,1),
--  Name VARCHAR(100),
--  EmailID VARCHAR(100),
--  Gender1ID INT,
--  Age INT,
--  CITY VARCHAR(100)
--)
--GO

----Add foreign key
--ALTER TABLE Person1 
--ADD CONSTRAINT Person1_Gender1ID_FK FOREIGN KEY (Gender1ID) 
--REFERENCES Gender1(ID)
--GO

----Insert some test data to Gender1 table
--INSERT INTO Gender1 VALUES('Male')
--INSERT INTO Gender1 VALUES('Female')
--INSERT INTO Gender1 VALUES('Unknown')
--GO

----Insert some test data into Person1 table
--INSERT INTO Person1 VALUES('PRANAYA','PRANAYA@G.COM',1,30,'MUMBAI')
--INSERT INTO Person1 VALUES('TARUN','TARUN@G.COM',1,27,'ODISHA')
--INSERT INTO Person1 VALUES('PRIYANKA','PRIYANKA@G.COM',2,25,'BANGALORE')
--INSERT INTO Person1 VALUES('PREETY','PREETY@G.COM',2,26,'BANGALORE')
--INSERT INTO Person1 VALUES('RAMESH','RAMESH@G.COM',3,27,'MUMBAI')
--INSERT INTO Person1 VALUES('RAMESH','RAMESH@G.COM',3,28,'MUMBAI')
--INSERT INTO Person1 VALUES('RAMESH','RAMESH@G.COM',3,27,'MUMBAI1')
--INSERT INTO Person1 VALUES('PRAMOD','PRAMOD@G.COM',1,28,'ODISHA')
--INSERT INTO Person1 VALUES('PRAMOD','PRAMOD@G.COM',1,28,'ODISHA')
--INSERT INTO Person1 VALUES('PRAMOD','PRAMOD@G.COM',1,28,'ODISHA')
--GO

--Types of Clauses in SQL Server:
--The SQL Server supports the following clauses

--Where (Filtering the records in a table)
--Order by clause (sorting the records in ascending or descending order)
--Top n clause (Fetching top n records)
--Group by clause (Grouping a set of rows)
--Having Clause (Filtering the data like where clause)

--SELECT *
--FROM Person1
--ORDER BY Age desc,Name asc;

-- OFFSET And FETCH Options used in the Order By Clause

--SELECT *
--FROM Person1
--ORDER by Name ASC OFFSET 5 ROWS

--SELECT *
--FROM Person1
--ORDER by ID ASC OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY

--SELECT *
--FROM Person1
--ORDER by ID ASC OFFSET 3 ROWS FETCH NEXT 4 ROWS ONLY

-- We can never specify the FETCH value as 0.
--SELECT *
--FROM Person1
--ORDER by ID ASC OFFSET 5 ROWS FETCH NEXT 0 ROWS ONLY

--Select top (2)  * from person1
--Select top (2) percent * from person1

--select * from person1 order by  Name desc
--SELECT TOP (3) Name FROM Person1
--ORDER BY Name desc
--SELECT TOP (3) WITH TIES Name FROM Person1
--ORDER BY Name desc

--TOP n Clause with Update Statement: 
--UPDATE TOP (3) Person1 SET Age = 18

--TOP n Clause with Delete statement: 
--DELETE TOP (2) FROM Person1


--Group By Cluase

--using group by clause in a statement the select list can contain only three things

--Columns that are associated with the GROUP BY clause.
--Aggregate or GROUP functions
--Constants

--Select * from person1

--select name,sum(age),count(Id) as count
--from person1 group by name
--order by name desc

--select name,sum(age),count(Id) as count,GETUTCDATE(),'Hello' as FixedValue 
--from person1 group by name
--order by name desc

--select name,city,sum(age),count(Id) as count
--from person1 group by name , city
--order by city,name desc

--Having caluse

--select name,sum(age),count(Id) as count,GETUTCDATE(),'Hello' as FixedValue 
--from person1 
--group by name
--having  name='RAMESH'
--order by name desc


-- Difference between where and having caluse
--Create table Sales
--(
--    Product nvarchar(50),
--    SaleAmount int
--)
--Go
--Insert into Sales values ('iPhone', 500)
--Insert into Sales values ('Laptop', 800)
--Insert into Sales values ('iPhone', 1000)
--Insert into Sales values ('Speakers', 400)
--Insert into Sales values ('Laptop', 600)
--Go

--SELECT Product, SUM(SaleAmount) AS TotalSales
--FROM Sales
--GROUP BY Product	

--SELECT Product, SUM(SaleAmount) AS TotalSales
--FROM Sales
--GROUP BY Product
--HAVING SUM(SaleAmount) > 1000

--SELECT Product, SUM(SaleAmount) AS TotalSales
--FROM Sales
--WHERE Product in ('iPhone', 'Speakers')
--GROUP BY Product

--SELECT Product, SUM(SaleAmount) AS TotalSales
--FROM Sales
--GROUP BY Product
--HAVING Product in ('iPhone', 'Speakers')

--SELECT Product, SUM(SaleAmount) AS TotalSales
--FROM Sales
--WHERE SUM(SaleAmount) > 1000
--GROUP BY Product

--SELECT Product, SaleAmount
--FROM Sales
--where Min(SaleAmount)>0	






