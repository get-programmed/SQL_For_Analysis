--- You can find the dataset here: (https://github.com/get-programmed/Python_For_Analysis/blob/main/Datasets/Sales_Data_Ex_2.csv)

--- SQL Views
CREATE VIEW [Sales_Data_Ex_2_view] AS
SELECT TransactionID, ProductName
FROM rsc.dummy_sales_data
WHERE PromotionApplied = 1 AND ReturnFlag = 1;

CREATE OR REPLACE VIEW [Sales_Data_Ex_2_view] AS
SELECT TransactionID, ProductName
FROM rsc.dummy_sales_data
WHERE PromotionApplied = 1 AND ReturnFlag = 1 AND Quantity > 5;

DROP VIEW Sales_Data_Ex_2_view;
