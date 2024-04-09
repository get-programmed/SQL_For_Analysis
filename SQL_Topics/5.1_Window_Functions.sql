--- Window functions

CREATE TABLE rahul_chundawat.Orders
(
	order_id INT,
	order_date DATE,
	customer_name VARCHAR(250),
	city VARCHAR(100),	
	order_amount MONEY
)
 
INSERT INTO rahul_chundawat.Orders
SELECT '1001','04/01/2017','David Smith','GuildFord',10000
UNION ALL	  
SELECT '1002','04/02/2017','David Jones','Arlington',20000
UNION ALL	  
SELECT '1003','04/03/2017','John Smith','Shalford',5000
UNION ALL	  
SELECT '1004','04/04/2017','Michael Smith','GuildFord',15000
UNION ALL	  
SELECT '1005','04/05/2017','David Williams','Shalford',7000
UNION ALL	  
SELECT '1006','04/06/2017','Paum Smith','GuildFord',25000
UNION ALL	 
SELECT '1007','04/10/2017','Andrew Smith','Arlington',15000
UNION ALL	  
SELECT '1008','04/11/2017','David Brown','Arlington',2000
UNION ALL	  
SELECT '1009','04/20/2017','Robert Smith','Shalford',1000
UNION ALL	  
SELECT '1010','04/25/2017','Peter Smith','GuildFord',500

--- Aggregate Window Functions

--- SUM()
---EX 1
SELECT 
	city, 
	SUM(order_amount) AS Total_Amount
FROM rahul_chundawat.orders GROUP BY city

--- EX 2
SELECT 
	order_id, 
	order_date, 
	customer_name, 
	city, 
	order_date, 
	SUM(order_amount) 
	OVER ( PARTITION BY city) AS Grand_Total
FROM rahul_chundawat.orders

--- AVG()
SELECT 
	order_id,
	order_date,
	customer_name,
	city,
	order_amount,
	AVG(order_amount)
	OVER ( PARTITION BY city) AS Average_order_amount
FROM rahul_chundawat.orders;

--- MIN()
SELECT
	order_id,
	order_date,
	customer_name,
	city,
	order_amount,
	MIN(order_amount)
	OVER ( PARTITION BY city) AS Minimum_order_amount
FROM rahul_chundawat.orders;

--- MAX()
SELECT
	order_id,
	order_date,
	customer_name,
	city,
	order_amount,
	MAX(order_amount)
	OVER ( PARTITION BY city) AS Minimum_order_amount
FROM rahul_chundawat.orders;

--- Count()
SELECT
	order_id,
	order_date,
	customer_name,
	city,
	order_amount,
	COUNT( order_id)
	OVER ( PARTITION BY city) AS Number_Of_IDs
FROM rahul_chundawat.orders;


--- Ranking Window Functions
--- RANK()
SELECT
	order_id,
	order_date,
	customer_name,
	city,
	order_amount,
	RANK() 
	OVER ( ORDER BY order_amount DESC) [Rank_of_order_amount]
FROM rahul_chundawat.orders;
