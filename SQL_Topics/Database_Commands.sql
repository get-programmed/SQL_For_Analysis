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
(105 , 'Vaibhav', 'Vishal', 'Bhopal', 'Madhya Pradesh'),
(106 , 'Singh', 'Rahul', 'Gurugram', 'Haryana'),
(107 , 'Kumar', 'Sonu', 'New Delhi', 'Delhi');

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


/* SQL Constraints

NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly
*/

--- SQL NOT NULL Constraint

--- SQL NOT NULL on CREATE TABLE
CREATE TABLE rsc.Employee (
	EmployeeID INT NOT NULL,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
	Age INT
	);

---SQL NOT NULL on ALTER TABLE
ALTER TABLE rsc.Employee
ALTER COLUMN Age INT NOT NULL;
