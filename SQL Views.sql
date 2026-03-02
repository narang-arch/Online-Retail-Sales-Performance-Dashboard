--DATABASE SELECTION
USE Retail_Analytics_DB;
Go



-- View: vw_Cancelled_Orders
-- Purpose: Contains all cancelled transactions
-- Logic: Filters invoices starting with 'C'

CREATE OR ALTER VIEW vw_Cancelled_Orders  AS
SELECT *
FROM Retail_Raw
WHERE Invoice LIKE 'C%';
Go



-- View: vw_Sales_Transactions
-- Purpose: Cleaned and deduplicated completed sales data
-- Logic:
--   - Removes null & invalid records
--   - Removes duplicates using ROW_NUMBER()
--   - Excludes negative quantity

CREATE OR ALTER VIEW  vw_Sales_Transactions AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Invoice, StockCode, Quantity, Price
               ORDER BY Invoice
           ) AS rn 
    FROM Retail_Raw
    WHERE 
        Invoice IS NOT NULL AND Invoice <> ''
        AND StockCode IS NOT NULL AND StockCode <> ''
        AND Description IS NOT NULL AND Description <> ''
        AND Quantity >= 1
        AND InvoiceDate IS NOT NULL
        AND Price > 0
        AND Customer_ID IS NOT NULL
        AND Country IS NOT NULL AND Country <> ''
) t
WHERE rn = 1;




--Aggregated order status summary for Power BI reporting
GO

CREATE OR ALTER VIEW vw_Order_Status_Summary AS
SELECT 
    COUNT(DISTINCT CASE WHEN Invoice LIKE 'C%' THEN Invoice END) AS Cancelled_Orders,
    COUNT(DISTINCT Invoice) AS Total_Orders,
    COUNT(DISTINCT CASE WHEN Invoice NOT LIKE 'C%' THEN Invoice END) AS Completed_Orders
FROM Retail_Raw;
GO