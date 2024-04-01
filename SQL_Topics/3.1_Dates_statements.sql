/* SQL Working With Dates
SQL Server comes with the following data types for storing a date or a date/time value in the database:

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: a unique number
*/
CREATE TABLE rsc.Dates (
	ID INT, --- Value you provide
	DATE_Format_1 DATE DEFAULT GETDATE(), --- 2024-03-29
	DATE_Format_2 DATETIME DEFAULT GETDATE(), --- 2024-03-29 16:50:35.340
	DATE_Format_3 SMALLDATETIME DEFAULT GETDATE(), --- 2024-03-29 16:51:00
	DATE_Format_4 TIMESTAMP --- 0x0000000000043DF8
);
