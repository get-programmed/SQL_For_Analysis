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



/* SQL UNIQUE Constraint
The UNIQUE constraint ensures that all values in a column are different.
Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.
A PRIMARY KEY constraint automatically has a UNIQUE constraint.
However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.
*/

--- SQL UNIQUE Constraint on CREATE TABLE
CREATE TABLE rsc.Employee (
	EmployeeID INT NOT NULL UNIQUE,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
	Age INT
	);

INSERT INTO rsc.Employee (EmployeeID, FirstName, MiddleName, LastName, Age)
VALUES (1, 'Rajeev', NULL, 'Sharma', 26); --- this query will execute successfully

INSERT INTO rsc.Employee (EmployeeID, FirstName, MiddleName, LastName, Age)
VALUES (2, NULL, NULL, 'Kumar', 31); --- this query will give error

INSERT INTO rsc.Employee (EmployeeID, FirstName, MiddleName, LastName, Age)
VALUES (1, 'Amit', NULL, 'Kumar', 27); --- this query will give error

--- UNIQUE constraint on multiple columns
CREATE TABLE rsc.Employee (
	EmployeeID INT NOT NULL UNIQUE,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
	Age INT,
	Mobile_Number VARCHAR(10),
	CONSTRAINT D_Employee UNIQUE (EmployeeID, Mobile_Number)
	);

INSERT INTO rsc.Employee (EmployeeID, FirstName, MiddleName, LastName, Age, Mobile_Number)
VALUES 
(1, 'Rajeev', NULL, 'Sharma', 26, 6355589599),
(2,'Kusum', 'Singh', 'Kumapawat', 23, 9555922567),
(3, 'Anant', NULL, 'Jangid', 32, 7268594533),
(4, 'Rajeev', NULL, 'Shrivastav', 26, 7588652344); --- this query will execute successfully

INSERT INTO rsc.Employee (EmployeeID, FirstName, MiddleName, LastName, Age, Mobile_Number)
VALUES 
(5, 'Rajeev', NULL, 'Sharma', 26, 6355589599),
(6,'Kusum', 'Singh', 'Kumapawat', 23, 9555922567),
(7, 'Anant', NULL, 'Jangid', 32, 7268594533),
(5 , 'Rajeev', NULL, 'Shrivastav', 26, 7895244685); --- this query will give error

--- SQL UNIQUE Constraint on ALTER TABLE
ALTER TABLE rsc.Employee
ADD UNIQUE (EmployeeID);

--- UNIQUE constraint on multiple columns on ALTER TABLE
ALTER TABLE rsc.Employee
ADD CONSTRAINT D_Employee2 UNIQUE (EmployeeID , Mobile_Number);

--- DROP a UNIQUE Constraint
ALTER TABLE rsc.Employee
DROP CONSTRAINT d_Employee2

--- SQL PRIMARY KEY Constraint
CREATE TABLE rsc.Employee (
	EmployeeID INT NOT NULL PRIMARY KEY,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
	Age INT,
	Mobile_Number VARCHAR(10)
	);

--- PRIMARY KEY constraint on multiple columns
CREATE TABLE rsc.Employee (
	EmployeeID INT NOT NULL,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
	Age INT,
	Mobile_Number VARCHAR(10),
	CONSTRAINT P_Employee PRIMARY KEY (EmployeeID, Mobile_Number)
	);

INSERT INTO rsc.Employee (EmployeeID, FirstName, MiddleName, LastName, Age, Mobile_Number)
VALUES 
(1, 'Rajeev', NULL, 'Sharma', 26, 6355589599),
(2,'Kusum', 'Singh', 'Kumapawat', 23, 9555922567),
(3, 'Anant', NULL, 'Jangid', 32, 7268594533),
(4, 'Rajeev', NULL, 'Shrivastav', 26, 7588652344); --- this query will execute successfully

INSERT INTO rsc.Employee (EmployeeID, FirstName, MiddleName, LastName, Age, Mobile_Number)
VALUES 
(5, 'Rajeev', NULL, 'Sharma', 26, 6355589599),
(6,'Kusum', 'Singh', 'Kumapawat', 23, 9555922567),
(7, 'Anant', NULL, 'Jangid', 32, 7268594533),
(5 , 'Rajeev', NULL, 'Shrivastav', 26, 7895244685); 
--- this query will execute successfully because the ID 5 is same for 2 values but mobile number is different
--- also the mobile number for ID 3 and 7 are same but because the ID is different is will execute without error

INSERT INTO rsc.Employee (EmployeeID, FirstName, MiddleName, LastName, Age, Mobile_Number)
VALUES 
(7, 'Ajay', NULL, 'Jain', 34, 7268594533); --- this query will give error because the ID and number can't be same, both are primary key

--- SQL PRIMARY KEY on ALTER TABLE
ALTER TABLE rsc.Employee
ADD PRIMARY KEY (EmployeeID);

--- PRIMARY KEY constraint on multiple columns on ALTER TABLE
ALTER TABLE rsc.Employee
ADD CONSTRAINT P_Employee PRIMARY KEY (EmployeeID, Mobile_Number); --- Both the EmployeeID, Mobile_Number Column need to Set on Not Null

--- DROP a PRIMARY KEY Constraint
ALTER TABLE rsc.Employee
DROP CONSTRAINT P_Employee;

--- SQL FOREIGN KEY Constraint
--- SQL FOREIGN KEY on CREATE TABLE
CREATE TABLE rsc.Employee (
	EmployeeID INT NOT NULL PRIMARY KEY,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
	Age INT,
	Mobile_Number VARCHAR(10) NOT NULL,
	DepartmentID INT FOREIGN KEY REFERENCES Department(DepartmentID)
	);

--- FOREIGN KEY constraint on multiple columns
CREATE TABLE rsc.Employee (
    EmployeeID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(225) NOT NULL,
    MiddleName VARCHAR(225),
    LastName VARCHAR(225) NOT NULL,
    AGE INT,
    Mobile_Number VARCHAR(10) NOT NULL,
    DepartmentID INT,
    OfficeLocationID INT,
    FOREIGN KEY (DepartmentID, OfficeLocationID) REFERENCES rsc.Department(DepartmentID, OfficeLocationID)
);

--- SQL FOREIGN KEY on ALTER TABLE
ALTER TABLE rsc.Employee
ADD CONSTRAINT F_Employee
FOREIGN KEY DepartmentID REFERENCES Department(DepartmentID);

--- SQL FOREIGN KEY on ALTER TABLE On multiple columns
ALTER TABLE rsc.Employee
ADD CONSTRAINT F_Employee
FOREIGN KEY ( DepartmentID, OfficeLocationID) REFERENCES Department( DepartmentID, OfficeLocationID);

--- DROP a FOREIGN KEY Constraint
ALTER TABLE rsc.Employee
DROP CONSTRAINT F_Employee;

--- SQL CHECK Constraint
CREATE TABLE rsc.Employee (
	EmployeeID INT NOT NULL PRIMARY KEY,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
	AGE INT CHECK (AGE >= 18),
	Mobile_Number VARCHAR(10)
);

--- SQL CHECK Constraint on multiple columns
CREATE TABLE rsc.Employee (
	EmployeeID INT NOT NULL PRIMARY KEY,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
	AGE INT,
	Mobile_Number VARCHAR(10),
	CONSTRAINT C_Employee CHECK (AGE >= 18 AND Mobile_Number LIKE '[0-9]%')
);

--- SQL CHECK on ALTER TABLE
ALTER TABLE rsc.Employee
ADD CHECK (Age >= 18);

--- SQL CHECK on ALTER TABLE on multiple columns
ALTER TABLE rsc.Employee
ADD CONSTRAINT C_Employee CHECK (Age >= 18 AND Mobile_Number LIKE '[0-9]%');

--- DROP a CHECK Constraint
ALTER TABLE rsc.Employee
DROP CONSTRAINT C_Employee;

--- SQL DEFAULT Constraint
CREATE TABLE rsc.Employee (
	EmployeeID INT NOT NULL,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
	AGE INT,
	Date_Of_Joining DATE DEFAULT GETDATE()
);

--- SQL DEFAULT on ALTER TABLE
ALTER TABLE rsc.Employee
ADD CONSTRAINT D_employee
DEFAULT 18 FOR Age;

--- DROP a DEFAULT Constraint
ALTER TABLE rsc.Employee
DROP CONSTRAINT D_Employee;

--- SQL CREATE INDEX Statement
CREATE INDEX N_INDEX 
ON rsc.Employee (EmployeeID, Mobile_Number);

--- SQL CREATE UNIQUE INDEX Syntax
CREATE UNIQUE INDEX N_INDEX 
ON rsc.Employee (EmployeeID, Mobile_Number);

--- DROP INDEX Statement
DROP INDEX rsc.Employee.N_INDEX;

--- SQL AUTO INCREMENT Field
CREATE TABLE rsc.Employee (
	EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(225) NOT NULL,
	MiddleName VARCHAR(225),
	LastName VARCHAR(225) NOT NULL,
);
