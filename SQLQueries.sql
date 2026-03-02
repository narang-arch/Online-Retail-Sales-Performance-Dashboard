                                       --Retail Sales & Order Performance Dashboard
                                              --Data Period: 2010 – 2011
                                                  --Currency: USD
--DATABASE SELECTION
USE Retail_Analytics_DB;


--Key Business Metrics
--KPIS SECTION

--1
select cast(
sum(Quantity*Price)  
 as decimal (10,2)) as Revenue 
from vw_Sales_Transactions;

--2
select count(distinct(Invoice)) as Completed_Orders 
from vw_Sales_Transactions
where Invoice NOT LIKE 'C%';

--3
select sum(Quantity) as Units_Sold
from vw_Sales_Transactions
WHERE Invoice NOT LIKE 'C%';

--4
select count(distinct(Customer_ID)) as Customers
FROM vw_Sales_Transactions
WHERE Invoice NOT LIKE 'C%';

--5
select cast(
sum(Quantity*Price)/count(distinct(Invoice))
 as decimal (10,2)) as Average_Order_Value 
from vw_Sales_Transactions;

--6
SELECT CAST(
SUM(Quantity*Price)/COUNT(DISTINCT(Customer_ID))
AS DECIMAL(10,2)) as Avg_Revenue_per_Customer
FROM vw_Sales_Transactions
WHERE Invoice NOT LIKE 'C%';

--7
SELECT COUNT(DISTINCT(StockCode)) as Active_Products
FROM vw_Sales_Transactions
WHERE Invoice NOT LIKE 'C%';

--8
SELECT
CAST(ABS(SUM(Quantity*Price)) AS DECIMAL(10,2)) AS Overall_Refund_Amount
FROM vw_Cancelled_Orders
WHERE Quantity < 0;


--Sales Trend Analysis
--CHARTS REQUIREMENT


--1 Monthly Revenue Trend
SELECT  DATEFROMPARTS(YEAR(InvoiceDate), MONTH(InvoiceDate), 1) AS Months, CAST((SUM(Quantity*price)) as DECIMAL(10,2)) as Monthly_Revenue FROM vw_Sales_Transactions
WHERE Invoice NOT LIKE 'C%'
AND Quantity > 0
AND InvoiceDate IS NOT NULL
GROUP BY  DATEFROMPARTS(YEAR(InvoiceDate), MONTH(InvoiceDate), 1)
ORDER BY Months ASC;

--2 Monthly Order Volume
SELECT 
    DATEFROMPARTS(YEAR(InvoiceDate), MONTH(InvoiceDate), 1) AS Months,
    COUNT(DISTINCT Invoice) AS Monthly_Orders
FROM vw_Sales_Transactions
WHERE Invoice NOT LIKE 'C%'
AND InvoiceDate IS NOT NULL
GROUP BY DATEFROMPARTS(YEAR(InvoiceDate), MONTH(InvoiceDate), 1)
ORDER BY Months;

--3 Total Cancelled Orders
SELECT COUNT(DISTINCT(Invoice)) AS Cancelled_Order
FROM vw_Cancelled_Orders;

--4 Cancellation Rate (%)
SELECT CAST(
    COUNT(DISTINCT CASE 
        WHEN Invoice LIKE 'C%' THEN Invoice 
    END) * 100.0 
    / COUNT(DISTINCT Invoice) AS DECIMAL (5,2)) AS Cancellation_Rate
    FROM Retail_Raw;




--Geographic Performance

--1Revenue by Country
SELECT Country, CAST((SUM(Quantity*price)) as DECIMAL(10,2)) as Country_Revenue FROM vw_Sales_Transactions
WHERE Invoice NOT LIKE 'C%'
GROUP BY Country
ORDER BY Country_Revenue DESC; 

--Product Performance Analysis

--1 Top 10 Products by Quantity Sold
SELECT TOP 10 SUM(Quantity) AS Units_Sold, StockCode , Description  from vw_Sales_Transactions
GROUP BY  Description, StockCode
ORDER BY Units_Sold DESC;


--2 Top 10 Products by Revenue
SELECT TOP 10 CAST(SUM(Quantity*Price) AS DECIMAL (10,2)) AS Revenue, StockCode , Description  from vw_Sales_Transactions
GROUP BY  Description, StockCode
ORDER BY Revenue DESC;


--3 Bottom 10 Products by Sales Volume
SELECT TOP 10 SUM(Quantity) AS Units_Sold, StockCode , COALESCE(Description, 'UNKOWN') AS Bottom_Products from vw_Sales_Transactions
where Quantity>0 AND Invoice NOT LIKE 'C%'
GROUP BY  COALESCE(Description,'UNKOWN') , StockCode
ORDER BY Units_Sold ASC;


--CUSTOMER BEHAVIOUR ANALYSIS



--1 Top 10 Customers by Revenue
SELECT top 10 Customer_ID as Customers, CAST(SUM(Quantity*Price) AS DECIMAL (10,2)) AS Revenue 
FROM vw_Sales_Transactions
WHERE Quantity > 0
AND Invoice NOT LIKE 'C%'
GROUP BY Customer_ID
ORDER BY Revenue DESC;

--2 Customer Distribution by Country
SELECT COUNT(DISTINCT(Customer_ID)) AS Number_of_Customer, Country
FROM vw_Sales_Transactions
GROUP BY Country
ORDER BY Number_of_Customer DESC;

retail


