SQL Subqueries Practice

📌 Project Overview

This repository contains SQL practice queries focused on subqueries and related SQL techniques. The script works with the da_ds_may database and demonstrates scalar subqueries, IN, EXISTS, correlated subqueries, aggregate queries, derived tables, GROUP BY, and HAVING.

The script begins by selecting the da_ds_may database and displaying its tables. fileciteturn3file0L1-L4

🎯 Learning Objectives

Understand SQL subqueries

Practice scalar subqueries

Use IN with subqueries

Use EXISTS with correlated subqueries

Calculate values with aggregate functions inside subqueries

Work with derived tables and nested subqueries

Compare WHERE and HAVING

Compare subquery and JOIN approaches

🔍 Subquery Examples

1. Scalar Subquery

SELECT name FROM customers
WHERE customer_id = (
    SELECT customer_id FROM orders
    WHERE order_id = 101
);

The inner query finds the customer ID for order 101; the outer query retrieves that customer's name. fileciteturn3file0L7-L9

2. IN with a Subquery

SELECT name FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

Returns customers whose IDs appear in the orders table. fileciteturn3file0L11-L12

3. EXISTS and Correlated Subquery

SELECT name FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o
    WHERE o.customer_id = c.customer_id
);

The subquery is correlated with the outer query and checks whether each customer has at least one order. fileciteturn3file0L14-L17

4. Correlated Subquery with COUNT()

SELECT c.name,
       (SELECT COUNT(*) FROM orders o
        WHERE o.customer_id = c.customer_id) AS customer_cnt
FROM customers c;

Counts orders for each customer using a correlated subquery. fileciteturn3file0L19-L21

5. LEFT JOIN Alternative

SELECT c.name, COUNT(order_id) AS order_cnt
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY order_cnt DESC;

This provides a join-and-aggregation alternative to the correlated count query. fileciteturn3file0L23-L28

🗄️ Practice Tables

Cust

Column

Data Type

Constraint

customer_id

INT

PRIMARY KEY

customer_name

VARCHAR(50)

—

city

VARCHAR(50)

—

fileciteturn3file0L30-L38

The script inserts six sample customers. fileciteturn3file0L42-L54

Ord

Column

Data Type

Constraint

order_id

INT

PRIMARY KEY

customer_id

INT

—

order_date

DATE

—

amount

INT

—

fileciteturn3file0L57-L65

The script inserts 12 sample orders dated between January and April 2024. fileciteturn3file0L71-L95

🧪 Practice Answers

Answer 1 — Customers Above Average Purchase

SELECT customer_id, SUM(amount) AS total_purchase
FROM Ord
GROUP BY customer_id
HAVING SUM(amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(amount) AS customer_total
        FROM Ord
        GROUP BY customer_id
    ) AS subquery
);

This uses nested subqueries: first calculating each customer's total, then calculating the average of those totals, and finally returning customers above that average. fileciteturn3file0L97-L107

Answer 2 — Customer with Maximum Order

SELECT DISTINCT customer_id
FROM Ord
WHERE amount = (SELECT MAX(amount) FROM Ord);

The subquery finds the maximum order amount and the outer query returns the customer ID associated with it. DISTINCT handles the possibility of multiple matching orders. fileciteturn3file0L109-L112

Answer 3 — Orders Above Average Amount

SELECT order_id, customer_id, order_date, amount
FROM Ord
WHERE amount > (SELECT AVG(amount) FROM Ord);

The subquery calculates the average order amount and the outer query returns orders above that average. fileciteturn3file0L114-L117

🧠 SQL Concepts Covered

Concept

Demonstrated

Subqueries

✅

Scalar subquery

✅

IN

✅

EXISTS

✅

Correlated subquery

✅

COUNT()

✅

SUM()

✅

AVG()

✅

MAX()

✅

GROUP BY

✅

HAVING

✅

LEFT JOIN

✅

Derived table

✅

Nested subquery

✅

DISTINCT

✅

Table aliases

✅

💡 Key Takeaways

A subquery lets one query use the result of another query.

IN is useful when the inner query returns multiple values.

EXISTS checks whether matching rows exist.

Correlated subqueries reference columns from the outer query.

Aggregate functions such as SUM(), AVG(), and MAX() can be used in subqueries.

A derived table is a subquery used in the FROM clause.

HAVING filters grouped aggregate results.

The script demonstrates both correlated-subquery and JOIN approaches to counting customer orders.

🚀 How to Run

Open subquery.sql in a SQL client such as MySQL Workbench.

Make sure da_ds_may and the referenced customers and orders tables are available.

Run the introductory subquery examples.

Create and populate the Cust and Ord tables.

Execute the three practice-answer queries.

Modify the queries to experiment with different conditions and aggregate functions.

Note: The first group of queries references existing customers and orders tables, while the later exercises create separate Cust and Ord tables. This structure is preserved from the supplied SQL script. fileciteturn3file0L7-L28 fileciteturn3file0L30-L65

📁 Repository Structure

.
├── subquery.sql
└── README.md

🛠️ Technologies

SQL

MySQL-compatible SQL syntax

Relational Database Management System (RDBMS)

📄 License

No license information is provided in the supplied SQL file. Add a license if you plan to distribute this repository publicly.
