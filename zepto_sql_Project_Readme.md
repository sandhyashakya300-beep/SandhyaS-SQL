Zepto SQL Analytics Project

📌 Project Overview

This project is a SQL-based analysis of Zepto product data. It demonstrates a complete data workflow in MySQL: creating and loading a working table from CSV data, enriching the data with sku_id, exploring the dataset, cleaning pricing data, and answering business-oriented analytical questions.

The SQL script works with the zepto_sql_project database and uses the zepto_test table as the main analysis table.

🎯 Objectives

Import Zepto product data from a CSV file into MySQL.

Create and prepare a dedicated analysis table.

Add and populate sku_id values from an existing zepto table.

Explore product categories, stock status, duplicate product names, and NULL values.

Clean invalid zero-price records and convert paise to rupees.

Analyze discounts, revenue, pricing, product weight, and inventory.

Practice SQL concepts such as JOIN, GROUP BY, HAVING, aggregate functions, CASE, DISTINCT, ORDER BY, and filtering.

🗄️ Database and Table

The project uses:

USE zepto_sql_project;

The main table is zepto_test with these columns:

Column

Data Type

Description

category

VARCHAR(255)

Product category

name

VARCHAR(255)

Product name

mrp

DECIMAL(10,2)

Maximum Retail Price

discountPercent

DECIMAL(5,2)

Discount percentage

availableQuantity

INT

Available inventory quantity

discountedSellingPrice

DECIMAL(10,2)

Selling price after discount

weightInGms

INT

Product weight in grams

outOfStock

BOOLEAN

Stock availability flag

quantity

INT

Product quantity field

sku_id

BIGINT UNSIGNED

SKU identifier added from the existing zepto table

The table definition and later sku_id addition are included in the SQL script. fileciteturn7file0L3-L14

📥 Data Import

The project enables MySQL local file loading and imports a CSV using LOAD DATA LOCAL INFILE.

The CSV configuration uses:

UTF-8 (utf8mb4) character encoding

Comma-separated fields

Double quotes as field enclosures

Windows-style line endings

The first CSV row is skipped as a header

The source script contains a local Windows file path, so it should be changed to the location of your own CSV file before execution. fileciteturn7file0L16-L38

Example structure:

LOAD DATA LOCAL INFILE 'YOUR_CSV_PATH'
INTO TABLE zepto_test
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

🔗 SKU ID Mapping

After importing the CSV data, the script adds a sku_id column and populates it by joining zepto_test with the existing zepto table.

The matching is performed using multiple product attributes:

category

name

mrp

discountPercent

availableQuantity

discountedSellingPrice

weightInGms

outOfStock

quantity

The matching rows receive the corresponding sku_id from the original zepto table. fileciteturn7file0L41-L56

🔍 Data Exploration

The project performs several initial checks before analysis.

1. Row Count

SELECT COUNT(*) FROM zepto_test;

Used to determine the number of records in the working table.

2. Sample Records

SELECT * FROM zepto_test
LIMIT 15;

Provides a quick look at the imported dataset.

3. NULL Value Check

The script checks multiple important columns for NULL values, including product name, category, pricing, weight, inventory, and stock status. fileciteturn7file0L71-L96

4. Product Categories

SELECT DISTINCT category
FROM zepto_test
ORDER BY category;

Identifies the different product categories present in the dataset.

5. Stock Status

The script groups records by outOfStock and counts their associated SKUs to compare stock-status records. fileciteturn7file0L98-L106

6. Repeated Product Names

SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto_test
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

This identifies product names associated with multiple SKUs. fileciteturn7file0L108-L113

🧹 Data Cleaning

The project includes two main cleaning operations.

Remove Zero-MRP Products

First, the script identifies products where either MRP or discounted selling price is zero:

SELECT * FROM zepto_test
WHERE mrp = 0 OR discountedSellingPrice = 0;

It then deletes rows where MRP is zero:

DELETE FROM zepto_test
WHERE mrp = 0;

Convert Paise to Rupees

The script then divides both MRP and discounted selling price by 100.0:

UPDATE zepto_test
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

This indicates that the source pricing values are being treated as paise before conversion to rupees. fileciteturn7file0L115-L129

Important: The DELETE and UPDATE statements modify the data in zepto_test. Consider taking a backup or working on a copy before running the cleaning section.

📊 Business Analysis

Q1. Top 10 Best-Value Products by Discount

The script returns the top 10 products according to discountPercent:

SELECT DISTINCT name, mrp, discountPercent
FROM zepto_test
ORDER BY discountPercent DESC
LIMIT 10;

Q2. High-MRP Products and Stock Status

The query filters products with MRP above ₹300 and outOfStock = FALSE, then sorts them by MRP descending. fileciteturn7file0L139-L144

Source-script note: The comment describes these as “Out of Stock,” but outOfStock = FALSE normally represents products that are not out of stock. The README preserves the actual SQL condition rather than changing it.

Q3. Estimated Revenue by Category

SELECT category,
       SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_test
GROUP BY category
ORDER BY total_revenue;

This calculates an estimated category-level revenue value using discounted selling price multiplied by available quantity. fileciteturn7file0L146-L151

Q4. Products with High MRP and Low Discount

The query identifies products where:

MRP is greater than ₹500

Discount is below 10%

SELECT DISTINCT name, mrp, discountPercent
FROM zepto_test
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

Q5. Top 5 Categories by Average Discount

SELECT category,
       ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_test
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

This calculates the average discount percentage for each category and returns five categories with the highest calculated average. fileciteturn7file0L159-L165

Q6. Price per Gram

For products weighing at least 100 grams, the project calculates:

price per gram = discounted selling price / weight in grams

The results are rounded to two decimal places and sorted by calculated price per gram. fileciteturn7file0L167-L172

Q7. Weight-Based Product Classification

A CASE expression categorizes products based on weight:

Weight

Category

< 1000g

Low

1000g to < 5000g

Medium

>= 5000g

Bulk

This demonstrates conditional classification using SQL CASE. fileciteturn7file0L174-L180

Q8. Total Inventory Weight by Category

SELECT category,
       SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_test
GROUP BY category
ORDER BY total_weight;

This calculates the total inventory weight represented by each category using product weight multiplied by available quantity. fileciteturn7file0L182-L187

🧠 SQL Concepts Demonstrated

Concept

Usage in Project

CREATE DATABASE

Creates the project database

CREATE TABLE

Creates the analysis table

LOAD DATA LOCAL INFILE

Imports CSV data

ALTER TABLE

Adds sku_id

UPDATE ... JOIN

Maps SKU IDs from the existing table

SELECT

Retrieves data

DISTINCT

Finds unique categories/products

WHERE

Filters records

GROUP BY

Performs category/group analysis

HAVING

Filters grouped results

COUNT()

Counts records/SKUs

SUM()

Calculates revenue and inventory weight

AVG()

Calculates average discount

ROUND()

Formats calculated values

CASE

Creates weight categories

ORDER BY

Sorts analytical results

LIMIT

Restricts result sets

JOIN

Matches data between tables

DELETE

Removes zero-MRP records

▶️ How to Run

Prerequisites

MySQL Server

MySQL Workbench or another MySQL client

The Zepto CSV dataset

An existing zepto table if you want to populate sku_id using the included mapping query

Steps

Open MySQL Workbench.

Create or select the zepto_sql_project database.

Ensure the source zepto table exists if SKU mapping is required.

Create the zepto_test table by running the table-creation section.

Enable local file loading if required by your MySQL configuration.

Replace the CSV path in LOAD DATA LOCAL INFILE with your actual file path.

Import the CSV data.

Add and populate sku_id.

Run the exploration queries.

Run the cleaning section when you are ready to modify the working data.

Execute the eight analysis queries.

📁 Repository Structure

zepto-sql-project/
│
├── zepto_sql_Project.sql
├── README.md
└── data/
    └── zepto_v2_fixed.csv   # Optional: keep locally if permitted

⚠️ Notes

The SQL script contains a machine-specific CSV path. Replace it before running on another computer.

The sku_id mapping depends on an existing zepto table with compatible data.

The cleaning section changes the contents of zepto_test.

The revenue calculation is an estimated inventory-value calculation based on discountedSellingPrice × availableQuantity; it is not necessarily realized sales revenue.

The source SQL's Q2 comment and condition do not describe the same stock status, so verify the intended condition before using that query.

The script uses MySQL-specific features such as LOAD DATA LOCAL INFILE.

🚀 Possible Improvements

Add explicit NOT NULL and CHECK constraints where appropriate.

Add indexes for frequently filtered or joined columns.

Validate that discountedSellingPrice is consistent with MRP and discount percentage.

Add category-level sales metrics if actual order/sales data is available.

Separate raw, cleaned, and analytical tables to preserve the original imported data.

Add more analysis around stock availability, price ranges, discount distributions, and SKU-level performance.

📚 Learning Outcomes

After completing this project, you can demonstrate practical experience with:

MySQL database and table management

CSV-to-SQL data loading

Data cleaning and transformation

Multi-column joins

Exploratory data analysis using SQL

Aggregation and grouping

Conditional logic with CASE

Pricing and inventory calculations

Business-oriented SQL analysis

🛠️ Technology

Database: MySQL

Language: SQL

Data Source: Zepto product dataset / CSV

Tool: MySQL Workbench or compatible MySQL client

📄 License

This project is intended for learning, portfolio, and SQL practice purposes.

Project: Zepto SQL Analytics Project
File: zepto_sql_Project.sql
