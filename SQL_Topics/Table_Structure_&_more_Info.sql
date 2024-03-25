-- Check data type of a specific column in a table (if you have schema nmae as well)
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'rsc' 
  AND TABLE_NAME = 'dummy_sales_data' 
  AND COLUMN_NAME = 'CustomerID';

--- To check the data types for all columns in a specific table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'rsc' 
  AND TABLE_NAME = 'dummy_sales_data';
