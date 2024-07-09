--- DDL COMMANDS
--- SQL CREATE DATABASE Statement
CREATE DATABASE testDB;

--- SQL DROP DATABASE Statement
DROP DATABASE testDB;

--- SQL BACKUP DATABASE for SQL Server
BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak'
WITH DIFFERENTIAL;

--- SQL CREATE TABLE Statement
CREATE TABLE rsc.Employee (
    EmployeeID int,
    LastName varchar(255),
    FirstName varchar(255),
    State varchar(255),
    City varchar(255)
);

--- SQL INSERT INTO Statement
INSERT INTO rsc.Employee (EmployeeID, LastName, FirstName, State, City)
VALUES (102 , 'Mishra', 'Milind', 'Bihar', 'Jharkhand'),
(103 , 'Sharma', 'Rishav', 'Maharashtra', 'Mumbai'),
(104 , NULL , NULL , 'Kerala', 'Trivandrum'),
(105 , 'Vaibhav', 'Vishal', 'Madhya Pradesh', 'Bhopal'),
(106 , 'Singh', 'Rahul', 'Haryana', 'Gurugram'),
(107 , 'Kumar', 'Sonu', 'Delhi', 'New Delhi');

--- SQL UPDATE Statement
UPDATE rsc.Employee
SET LastName = 'Tyagi' , FirstName = 'Amit'
WHERE EmployeeID = 104;


--- SQL ALTER TABLE Statement
--- Add Column
ALTER TABLE rsc.Employee
ADD EmailID VARCHAR(255);

--- Modify a Column
ALTER TABLE rsc.Employee
ALTER COLUMN EmailID INT;

--- Rename Column
EXEC sp_rename 'rsc.Employee.EmailID', 'Email_ID', 'COLUMN';

--- DROP Column
ALTER TABLE rsc.Employee
DROP COLUMN Email_ID;

--- DROP TABLE
DROP TABLE rsc.Employee
