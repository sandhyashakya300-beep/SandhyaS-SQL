SQL Customer, Orders & Payments Database

📌 Project Overview

This project is a SQL practice repository based on customer, order, and payment data. The script uses the da_ds_may database and demonstrates table creation, data insertion, joins, aggregation, sorting, NULL handling, UNION, and self-joins. The source creates Customers, Orders, Payments, and Employees_n tables.

🗂️ Database Schema

Customers

Column

Data Type

Description

customer_id

INT

Customer identifier

name

VARCHAR(50)

Customer name

city

VARCHAR(50)

Customer city

Orders

Column

Data Type

Description

order_id

INT

Order identifier

customer_id

INT

Customer identifier associated with the order

amount

INT

Order amount

order_date

DATE

Date of the order

Payments

Column

Data Type

Description

payment_id

INT

Payment identifier

order_id

INT

Associated order identifier

payment_method

VARCHAR(20)

Payment method

Employees_n

Column

Data Type

Description

emp_id

INT

Employee identifier

name

VARCHAR(50)

Employee name

manager_id

INT

Identifier of the employee's manager

🔍 SQL Concepts Demonstrated

INNER JOIN

Combines customer and order records when their customer_id values match.

SELECT c.name, o.order_id, o.amount
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

Filtering and Sorting

The script filters orders with amount >= 500 and sorts them in descending order.

SELECT c.name, o.order_id, o.amount
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.amount >= 500
ORDER BY o.amount DESC;

Aggregation with SUM() and GROUP BY

The script calculates order totals and groups results by customer and order, and also calculates total order amounts by customer.

SELECT c.name, SUM(o.amount) AS Total_amt
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.amount >= 500
GROUP BY c.name
ORDER BY Total_amt DESC;

LEFT JOIN

Keeps all customers and matches their orders where available.

SELECT c.name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;

RIGHT JOIN

Keeps all orders and matches customer information where available.

SELECT c.name, o.order_id
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id;

UNION

The script combines the results of a LEFT JOIN and a RIGHT JOIN using UNION, demonstrating how result sets can be combined.

NULL Handling

Some orders contain NULL amounts, and the script demonstrates how to identify them:

SELECT order_id
FROM orders
WHERE amount IS NULL;

Self-Join

Employees_n is joined to itself to display each employee alongside their manager.

SELECT e.name AS Employee, m.name AS Manager
FROM Employees_n AS e
LEFT JOIN Employees_n AS m
ON e.manager_id = m.emp_id;

Multiple Table JOIN

Customer, order, and payment information is combined with two joins:

SELECT c.name, o.order_id, p.payment_method
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
JOIN payments AS p
ON o.order_id = p.order_id;

🧠 SQL Skills Covered

SQL Concept

Included

CREATE TABLE

✅

INSERT INTO

✅

SELECT

✅

INNER JOIN

✅

LEFT JOIN

✅

RIGHT JOIN

✅

Multiple-table JOIN

✅

Self-Join

✅

WHERE

✅

ORDER BY

✅

GROUP BY

✅

SUM()

✅

DISTINCT

✅

UNION

✅

IS NULL

✅

Table aliases

✅

⚠️ Observations

The supplied table definitions do not declare primary-key or foreign-key constraints, although the queries use customer_id and order_id as relationships.

The script includes order records whose customer IDs are not all represented by the customer records supplied. This provides useful examples for unmatched rows in LEFT JOIN, RIGHT JOIN, and UNION queries.

DISTINCT(c.name) is redundant in the query that already uses GROUP BY c.name.

amount is defined as INT, so the supplied schema does not represent fractional monetary values.

🚀 How to Run

Open customer.sql in a compatible SQL environment.

Make sure the da_ds_may database is available.

Run USE da_ds_may;.

Create the tables and execute the INSERT statements.

Run the SELECT queries individually to explore the results.

Experiment with different joins, filters, and aggregate functions.

📁 Repository Structure

.
├── customer.sql
└── README.md

🎯 Learning Objectives

This project is useful for learning:

Relational database concepts

Customer and order relationships

SQL joins

Multi-table queries

Aggregation and grouping

Sorting query results

Handling missing values

Self-joins

Combining result sets with UNION

🛠️ Technologies

SQL

Relational Database Management System (RDBMS)

📄 License

No license information is provided in the supplied SQL file. Add a license if you plan to distribute this repository publicly.
