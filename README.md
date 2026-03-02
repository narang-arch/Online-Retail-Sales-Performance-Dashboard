# Online-Retail-Sales-Performance-Dashboard

 Project Overview
This project analyzes online retail transactional data to evaluate sales performance, customer behavior, product trends, and order status distribution.
The solution was built using SQL Server for data preparation and Power BI for data modeling and visualization, transforming raw transactional data into business-driven insights.
 Tech Stack
SQL Server – Data cleaning, transformation, view optimization
Power BI – Data modeling, DAX measures, dashboard design
 Data Preparation (SQL)
Removed null and invalid records
Filtered cancelled transactions
Deduplicated records using ROW_NUMBER()
Created optimized reporting views:
vw_Sales_Transactions
vw_Cancelled_Orders
vw_Order_Status_Summary
Using aggregated SQL views improved Power BI performance and reduced model complexity.
 Dashboard Features
KPIs
Total Revenue
Total Customers
Completed Orders
Units Sold
Active Products
Avg Revenue per Customer
Overall Refund Amount
Visual Analysis
Monthly Revenue Trend
Monthly Orders Trend
Revenue Distribution by Country
Order Status Distribution
Top Products by Revenue
Top Customers by Revenue
Bottom Products by Revenue
 Key Insights
Revenue is highly concentrated in the United Kingdom (~89%).
Peak sales observed in September.
Cancellation rate remains relatively low (~15%), indicating stable order performance.
A small group of customers and products drives the majority of revenue.
 What This Project Demonstrates
End-to-end analytics workflow (SQL → Power BI)
Data cleaning & transformation
SQL performance optimization using views
Data modeling & DAX calculations
Business-focused dashboard design
Analytical storytelling
