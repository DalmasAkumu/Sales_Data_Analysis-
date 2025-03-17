This repository contains the work completed for the CMS Data Exercise and SQL Test as part of the Clipboard Health data analysis task. The project involves analyzing nursing home staffing data from the Centers for Medicare & Medicaid Services (CMS) and writing SQL queries to solve specific business problems.

Part 1: CMS Data Exercise
Objective
The goal of this exercise is to analyze the Payroll Based Journal (PBJ) Daily Nurse Staffing dataset and provide actionable recommendations to the Clipboard Health sales leadership team. The analysis focuses on the most recent quarter (2024Q2) and leverages additional CMS datasets to uncover insights.

Tools Used
Python: For data cleaning, analysis, and visualization.

Pandas: For data manipulation and analysis.

Matplotlib: For creating visualizations (charts and graphs).

Datasets Used
PBJ Daily Nurse Staffing (2024Q2): Contains daily staffing data for nursing homes, including employee and contractor information.

Additional CMS Datasets: Joined with PBJ data to enrich the analysis (e.g., nursing home characteristics, quality metrics).

Analysis and Recommendations
The analysis focused on the following key areas:

Staffing Patterns: Comparison of employee vs. contractor staffing levels across states and nursing homes.

Market Opportunities: Identification of states and nursing homes with high contractor demand.

Performance Metrics: Correlation between staffing levels and nursing home quality ratings.

Findings and Recommendations
The findings and recommendations are documented in the following files:

Sales Analysis Recommendation.docx: A detailed report discussing the analysis, insights, and actionable recommendations for the sales leadership team.

Recommendation_Report.txt: Contains a link to the online version of the recommendation document for easy access.

Part 2: SQL Test
Objective
The SQL test involves writing queries to solve specific business problems using a hypothetical database schema. The queries are designed to extract insights related to sales, customers, and products.

Database Schema
The database consists of the following tables:

Sales:

sales_id (INT)

customer_id (INT)

product_id (INT)

sale_date (DATE)

quantity (INT)

total_amount (DECIMAL)

Customers:

customer_id (INT)

customer_name (VARCHAR)

sales_region (VARCHAR)

sign_up_date (DATE)

Products:

product_id (INT)

product_name (VARCHAR)

category (VARCHAR)

price (DECIMAL)

SQL Queries
All SQL queries for the test have been completed and are included in the file named Question_Two_Answers.sql. The queries address the following tasks:

Sales in the last 30 days.

Total revenue by product category in the last year.

Customers in the "West" region who made purchases in 2023.

Sales summary by customer (total sales, quantity, and revenue).

Top 3 customers by revenue in 2023.

Product ranking by total sales quantity in 2023.

Categorization of customers into "New" or "Existing" based on sign-up date.

Monthly sales for the last 12 months.

Product categories generating more than $50,000 in revenue in the last 6 months.

Identification of sales where total_amount does not match the expected value (quantity * price).

How to Use This Repository
CMS Data Analysis:

The Python scripts used for data analysis are located in the project.ipynb Jupyter notebook.

The findings and recommendations are documented in Sales Analysis Recommendation.docx and Recommendation_Report.txt.

SQL Queries:

All SQL queries are provided in the file Question_Two_Answers.sql.

The file contains comments explaining each query and its purpose.

Dependencies
Python 3.x

Pandas

Matplotlib

MySQL or any SQL-compatible database for running the SQL queries.

