-- Drop existing tables if they exist
DROP TABLE IF EXISTS rsc.sales;
GO
DROP TABLE IF EXISTS rsc.orders;
GO
DROP TABLE IF EXISTS rsc.onlinecustomers;
GO

-- Create the 'onlinecustomers' table with columns: customerid, CustomerName, CustomerCity, Customermail
CREATE TABLE rsc.onlinecustomers (
    customerid INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    CustomerCity VARCHAR(100),
    Customermail VARCHAR(100)
);
GO

-- Create the 'orders' table with columns: orderId, customerid, ordertotal, discountrate, orderdate
CREATE TABLE rsc.orders (
    orderId INT PRIMARY KEY IDENTITY(1,1),
    customerid INT,
    ordertotal FLOAT,
    discountrate FLOAT,
    orderdate DATETIME
);
GO

-- Create the 'sales' table with columns: salesId, orderId, salestotal
CREATE TABLE rsc.sales (
    salesId INT PRIMARY KEY IDENTITY(1,1),
    orderId INT,
    salestotal FLOAT
);
GO

-- Insert data into the 'onlinecustomers' table
INSERT INTO [rsc].[onlinecustomers]([CustomerName],[CustomerCity],[Customermail]) VALUES (N'Salvador',N'Philadelphia',N'tyiptqo.wethls@chttw.org');
INSERT INTO [rsc].[onlinecustomers]([CustomerName],[CustomerCity],[Customermail]) VALUES (N'Gilbert',N'San Diego',N'rrvyy.wdumos@lklkj.org');
INSERT INTO [rsc].[onlinecustomers]([CustomerName],[CustomerCity],[Customermail]) VALUES (N'Ernest',N'New York',N'ymuea.pnxkukf@dwv.org');
INSERT INTO [rsc].[onlinecustomers]([CustomerName],[CustomerCity],[Customermail]) VALUES (N'Stella',N'Phoenix',N'xvsfzp.rjhtni@rdn.com');
INSERT INTO [rsc].[onlinecustomers]([CustomerName],[CustomerCity],[Customermail]) VALUES (N'Jorge',N'Los Angeles',N'oykbo.vlxopp@nmwhv.org');
INSERT INTO [rsc].[onlinecustomers]([CustomerName],[CustomerCity],[Customermail]) VALUES (N'Jerome',N'San Antonio',N'wkabc.ofmhetq@gtmh.co');
INSERT INTO [rsc].[onlinecustomers]([CustomerName],[CustomerCity],[Customermail]) VALUES (N'Edward',N'Chicago',N'wguexiymy.nnbdgpc@juc.co');

-- Insert data into the 'orders' table
INSERT INTO [rsc].[orders]([customerid],[ordertotal],[discountrate],[orderdate]) VALUES (3,1910.64,5.49,CAST('03-Dec-2019' AS DATETIME));
INSERT INTO [rsc].[orders]([customerid],[ordertotal],[discountrate],[orderdate]) VALUES (4,150.89,15.33,CAST('11-Jun-2019' AS DATETIME));
INSERT INTO [rsc].[orders]([customerid],[ordertotal],[discountrate],[orderdate]) VALUES (5,912.55,13.74,CAST('15-Sep-2019' AS DATETIME));
INSERT INTO [rsc].[orders]([customerid],[ordertotal],[discountrate],[orderdate]) VALUES (7,418.24,14.53,CAST('28-May-2019' AS DATETIME));
INSERT INTO [rsc].[orders]([customerid],[ordertotal],[discountrate],[orderdate]) VALUES (55,512.55,13.74,CAST('15-Jun-2019' AS DATETIME));
INSERT INTO [rsc].[orders]([customerid],[ordertotal],[discountrate],[orderdate]) VALUES (57,118.24,14.53,CAST('28-Dec-2019' AS DATETIME));

-- Insert data into the 'sales' table
INSERT INTO [rsc].[sales]([orderId],[salestotal]) VALUES (3,370.95);
INSERT INTO [rsc].[sales]([orderId],[salestotal]) VALUES (4,882.13);
INSERT INTO [rsc].[sales]([orderId],[salestotal]) VALUES (12,370.95); -- Note: No corresponding orderId 12 in the orders table
INSERT INTO [rsc].[sales]([orderId],[salestotal]) VALUES (13,882.13); -- Note: No corresponding orderId 13 in the orders table
INSERT INTO [rsc].[sales]([orderId],[salestotal]) VALUES (55,170.95);
INSERT INTO [rsc].[sales]([orderId],[salestotal]) VALUES (57,382.13);
