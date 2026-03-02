# Online-Retail-Sales-Performance-Dashboard

👇

📊 Online Retail Sales Performance Dashboard
📌 Project Overview

This project presents an end-to-end sales analytics solution for an online retail business.
It analyzes transactional data to evaluate sales performance, customer behavior, product trends, and order status distribution.

The solution leverages SQL Server for data preparation and optimization and Power BI for data modeling, DAX calculations, and interactive visualization, transforming raw transactional data into actionable business insights.

🛠 Tech Stack

SQL Server – Data cleaning, transformation, and performance-optimized reporting views

Power BI – Data modeling, DAX measures, and interactive dashboard design

🧹 Data Preparation (SQL Server)

The raw transactional data was processed using SQL to ensure accuracy and performance:

Removed null and invalid records

Filtered cancelled transactions

Deduplicated records using ROW_NUMBER()

Created optimized SQL views for reporting:

vw_Sales_Transactions

vw_Cancelled_Orders

vw_Order_Status_Summary

Using pre-aggregated SQL views significantly improved Power BI refresh performance and reduced data model complexity.

📈 Dashboard Features
🔹 Key Performance Indicators (KPIs)

Total Revenue

Total Customers

Completed Orders

Units Sold

Active Products

Average Revenue per Customer

Overall Refund Amount

🔹 Visual Analysis

Monthly Revenue Trend

Monthly Orders Trend

Revenue Distribution by Country

Order Status Distribution

Top Products by Revenue

Top Customers by Revenue

Bottom Products by Revenue

🧠 Key Business Insights

Revenue is heavily concentrated in the United Kingdom (~89%)

Peak sales occur in September

Cancellation rate remains relatively low (~15%), indicating stable order fulfillment

A small group of customers and products contributes to the majority of revenue, following the Pareto principle

🚀 What This Project Demonstrates

End-to-end analytics workflow (SQL Server → Power BI)

Data cleaning and transformation best practices

SQL performance optimization using views

Effective data modeling and DAX calculations

Business-focused dashboard design

Clear analytical storytelling for decision-making

👤 Author

Ruhani Narang
Data Analyst | Power BI | SQL | Python
