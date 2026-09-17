SQL Window Functions Practice

📌 Project Overview

This repository contains a SQL practice script focused on window functions and Common Table Expressions (CTEs). The script demonstrates ranking functions, running totals, and customer-level sales aggregation.

The main window-function syntax presented in the source is:

function() OVER (PARTITION BY ... ORDER BY ...)

The supplied script works with an existing orders table and later uses the da_ds_may database and ord table for customer-sales examples. fileciteturn4file0L1-L2 fileciteturn4file0L30-L34

🎯 Learning Objectives

This project is designed to practice:

Window functions

ROW_NUMBER()

RANK()

DENSE_RANK()

OVER()

ORDER BY inside window functions

Running totals with SUM() OVER()

Common Table Expressions (WITH)

GROUP BY

Filtering aggregated results

Customer-level sales analysis

🔢 Window Function Examples

1. ROW_NUMBER()

SELECT amount,
       ROW_NUMBER() OVER(ORDER BY amount DESC) AS index_val
FROM orders;

This assigns a sequential row number based on amount in descending order. fileciteturn4file0L4-L6

2. RANK()

SELECT amount,
       RANK() OVER(ORDER BY amount DESC) AS RNK
FROM orders;

This assigns rankings according to descending order amount. fileciteturn4file0L8-L10

3. DENSE_RANK()

SELECT amount,
       DENSE_RANK() OVER(ORDER BY amount DESC) AS DRNK
FROM orders;

This demonstrates dense ranking based on descending order amount. fileciteturn4file0L12-L14

4. Comparing Ranking Functions

The script applies all three ranking functions to the same orders dataset:

SELECT amount,
       ROW_NUMBER() OVER(ORDER BY amount DESC) AS index_val,
       RANK() OVER(ORDER BY amount DESC) AS RNK,
       DENSE_RANK() OVER(ORDER BY amount DESC) AS DRNK
FROM orders;

This makes it possible to compare how ROW_NUMBER(), RANK(), and DENSE_RANK() behave on the same data. fileciteturn4file0L16-L20

5. Ranking Orders with Customer IDs

SELECT customer_id,
       amount,
       RANK() OVER(ORDER BY amount DESC) AS RNK
FROM orders;

This displays each customer's ID, order amount, and its rank based on amount. fileciteturn4file0L22-L24

📈 Running Total

The script calculates a cumulative amount based on order_date:

SELECT DISTINCT order_date,
       SUM(amount) OVER(ORDER BY order_date) AS run_total
FROM orders;

The SUM() window function calculates a running total ordered by order_date. DISTINCT is applied to the final selected rows. fileciteturn4file0L26-L28

🧮 Customer Sales Analysis with CTEs

The script also demonstrates Common Table Expressions (CTEs) using the WITH clause.

1. Customers Whose Total Purchases Exceed 8000

WITH cust_sales AS (
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM ord
    GROUP BY customer_id
)
SELECT *
FROM cust_sales
WHERE total_sales > 8000;

The CTE first calculates total sales for each customer. The outer query then filters those results where total_sales is greater than 8000. fileciteturn4file0L30-L37

2. Total Purchase of Every Customer

WITH customersales AS (
    SELECT customer_id,
           SUM(amount) AS total_sales
    FROM ord
    GROUP BY customer_id
)
SELECT *
FROM customersales;

This creates a temporary named result containing the total sales for every customer and then returns the complete result. fileciteturn4file0L39-L44

🧠 Concepts Covered

SQL Concept

Demonstrated

Window functions

✅

OVER()

✅

ORDER BY in window functions

✅

ROW_NUMBER()

✅

RANK()

✅

DENSE_RANK()

✅

Running total

✅

SUM() OVER()

✅

WITH / CTE

✅

SUM()

✅

GROUP BY

✅

Aggregate filtering

✅

💡 Key Takeaways

Window functions calculate values across related rows while retaining the individual rows in the result.

ROW_NUMBER(), RANK(), and DENSE_RANK() are used in the script for ranking order amounts.

The script places ORDER BY amount DESC inside the OVER() clause for ranking.

SUM(amount) OVER(ORDER BY order_date) is used to create a running total.

CTEs provide named intermediate query results using the WITH clause.

The customer-sales examples use SUM(amount) and GROUP BY customer_id to calculate total purchases.

⚠️ Source-Specific Notes

The window-function examples reference an existing orders table.

The CTE examples reference an ord table after switching to the da_ds_may database.

The supplied file does not contain the creation or sample-data statements for these referenced tables, so their full schemas and data cannot be established from this file alone. fileciteturn4file0L4-L28 fileciteturn4file0L30-L44

The source uses DISTINCT in the running-total query; this README preserves that query as supplied rather than changing it. fileciteturn4file0L26-L28

🚀 How to Run

Open window_function.sql in a SQL client such as MySQL Workbench.

Make sure the referenced orders table is available.

Make sure the da_ds_may database and ord table are available for the CTE examples.

Execute each query individually.

Compare the results of ROW_NUMBER(), RANK(), and DENSE_RANK().

Experiment with different ordering columns and aggregate calculations.

📁 Repository Structure

.
├── window_function.sql
└── README.md

🛠️ Technologies

SQL

MySQL-compatible SQL syntax

Relational Database Management System (RDBMS)

📄 License

No license information is provided in the supplied SQL file. Add a license if you plan to distribute this repository publicly.
