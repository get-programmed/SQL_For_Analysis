--- SQL SELECT Statement
SELECT * FROM rsc.onlinecustomers

SELECT * FROM rsc.orders

SELECT * FROM rsc.sales

--- SQL SELECT DISTINCT Statement
SELECT DISTINCT CustomerName FROM [rsc].[onlinecustomers]

--- SQL WHERE Clause
SELECT 
	CustomerName 
FROM [rsc].[onlinecustomers] 
WHERE customerid = 3

--- SQL ORDER BY Keyword
SELECT 
	CustomerName, CustomerCity, Customermail
FROM [rsc].[onlinecustomers]
ORDER BY CustomerName, CustomerCity DESC, Customermail ASC

--- SQL AND Operator
SELECT 
	SUM(ordertotal) AS Total 
FROM [rsc].[orders]
WHERE orderdate BETWEEN CAST('15-Sep-2019' AS DATETIME) AND CAST('03-Dec-2019' AS DATETIME)

--- SQL OR Operator
SELECT 
	CustomerName
FROM [rsc].[onlinecustomers]
WHERE customerid = 1 OR customerid = 3 

--- SQL NOT Operator
SELECT 
	customerid, CustomerName
FROM [rsc].[onlinecustomers]
WHERE NOT customerid = 2

--- SQL INSERT INTO Statement
INSERT INTO [rsc].[sales] ([orderId],[salestotal]) VALUES (7,523.45)

--- SQL NULL Values
SELECT 
	CustomerName
FROM [rsc].[onlinecustomers]
WHERE CustomerName IS NULL

--- The SQL UPDATE Statement
UPDATE [rsc].[sales]
SET orderId = 9
WHERE salesId = 7

--- The SQL DELETE Statement
DELETE FROM [rsc].[sales] WHERE salesId = 7

--- SQL TOP
SELECT 
	TOP 5 *
FROM [rsc].[onlinecustomers]

--- SQL MIN() and MAX() Functions
SELECT
	MAX(ordertotal) AS MAX_, MIN(ordertotal) AS MIN_
FROM [rsc].[orders]

--- SQL COUNT() Function
SELECT 
	COUNT(*) AS Total_Customer
FROM [rsc].[onlinecustomers]

--- SQL SUM() Function
SELECT 
	SUM(ordertotal) AS Total_Value
FROM [rsc].[orders]

--- SQL AVG() Function (output - 670.518333333333)
SELECT 
	AVG(ordertotal) AS Total_Value
FROM [rsc].[orders]

--- SQL CAST() Function (output - 670)
SELECT 
	CAST( AVG(ordertotal) AS int)
FROM [rsc].[orders]

--- SQL LIKE Operator
SELECT
	CustomerCity
FROM [rsc].[onlinecustomers]
WHERE CustomerCity LIKE '%o'

--- Wildcard % _ [] ^ - {}
SELECT
	CustomerCity
FROM [rsc].[onlinecustomers]
WHERE CustomerCity LIKE '%o'

SELECT
	CustomerCity
FROM [rsc].[onlinecustomers]
WHERE CustomerCity LIKE '______o'

SELECT
	CustomerCity
FROM [rsc].[onlinecustomers]
WHERE CustomerCity LIKE '[San]%o' 

SELECT
	CustomerCity
FROM [rsc].[onlinecustomers]
WHERE CustomerCity LIKE '[a-f]%o' --- Return all customers starting with "a", "b", "c", "d", "e" or "f":

SELECT
	CustomerCity
FROM [rsc].[onlinecustomers]
WHERE CustomerCity LIKE '__n%o'

--- SQL IN Operator
SELECT
	CustomerCity
FROM [rsc].[onlinecustomers]
WHERE CustomerCity IN ('San Diego', 'San Antonio')

--- SQL BETWEEN Operator
SELECT 
	CustomerName 
FROM [rsc].[onlinecustomers] 
WHERE customerid BETWEEN 3 AND 4

--- SQL Joins
SELECT *
FROM [rsc].[onlinecustomers] AS rsonl
JOIN [rsc].[orders] AS rsord ON rsonl.customerid = rsord.customerid

--- SQL INNER Joins
SELECT *
FROM [rsc].[onlinecustomers] AS rsonl
INNER JOIN [rsc].[orders] AS rsord ON rsonl.customerid = rsord.customerid

--- SQL LEFT JOIN Keyword
SELECT *
FROM [rsc].[onlinecustomers] AS rsonl
LEFT JOIN [rsc].[orders] AS rsord ON rsonl.customerid = rsord.customerid
---WHERE rsord.customerid IS NOT NULL

--- SQL LEFT JOIN Keyword
SELECT *
FROM [rsc].[onlinecustomers] AS rsonl
RIGHT JOIN [rsc].[orders] AS rsord ON rsonl.customerid = rsord.customerid
---WHERE rsonl.customerid IS NOT NULL

--- SQL FULL OUTER JOIN Keyword
SELECT *
FROM [rsc].[onlinecustomers] AS rsonl
FULL OUTER JOIN [rsc].[orders] AS rsord ON rsonl.customerid = rsord.customerid
