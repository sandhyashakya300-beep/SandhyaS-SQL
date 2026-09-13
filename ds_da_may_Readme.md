SQL Employee Database — da_ds_may

📌 Project Overview

This repository contains a beginner-friendly SQL practice script for creating and working with an employee database named da_ds_may.

The SQL script demonstrates database and table operations, inserting employee records, filtering data, aggregate functions, NULL handling, GROUP BY, and HAVING clauses. The source script creates an EMPLOYEE table with employee ID, name, gender, department, and salary fields. fileciteturn1file0L9-L15

🗄️ Database Operations

The script demonstrates:

Creating and dropping the da_ds_may database

Displaying databases with SHOW DATABASES

Selecting the database with USE da_ds_may

Creating and dropping the EMPLOYEE table

Displaying tables with SHOW TABLES

The script contains both CREATE DATABASE da_ds_may and DROP DATABASE da_ds_may, so execute them carefully. fileciteturn1file0L1-L7

👥 EMPLOYEE Table

Column

Data Type

Constraint

Description

empt_id

INT

PRIMARY KEY

Unique employee identifier

empt_name

VARCHAR(77)

—

Employee name

gender

VARCHAR(345)

—

Employee gender

department

VARCHAR(33)

—

Employee department

salary

FLOAT

—

Employee salary

These columns and the primary-key definition come directly from the supplied SQL script. fileciteturn1file0L9-L15

📊 Sample Employee Data

The script inserts employees across acting, DS, DA, and AI departments. It also demonstrates employee records with NULL salary values. fileciteturn1file0L23-L36 fileciteturn1file0L58-L61

🔍 SQL Concepts Demonstrated

Selecting Data

SELECT * FROM EMPLOYEE;

Retrieves all columns and records from the employee table. fileciteturn1file0L38-L40

Filtering with IN

SELECT empt_name, department
FROM EMPLOYEE
WHERE department IN ("DA", "DS");

Filters employees belonging to either the DA or DS department. fileciteturn1file0L42-L43

Counting Records

The script uses COUNT() with both IN and NOT IN to count department values matching or not matching selected departments. fileciteturn1file0L45-L49

Aggregate Functions

SELECT MAX(salary) FROM EMPLOYEE;
SELECT MIN(salary) FROM EMPLOYEE;

Demonstrates finding maximum and minimum salary values. fileciteturn1file0L51-L53

BETWEEN

SELECT empt_name, salary
FROM EMPLOYEE
WHERE salary BETWEEN 30000 AND 65000;

Filters employees whose salary is within the specified range. fileciteturn1file0L55-L56

Handling NULL

SELECT empt_name
FROM EMPLOYEE
WHERE salary IS NULL;

SELECT empt_name
FROM EMPLOYEE
WHERE salary IS NOT NULL;

The script also counts employees with missing salary values. fileciteturn1file0L58-L71

GROUP BY and HAVING

SELECT department, AVG(salary)
FROM EMPLOYEE
GROUP BY department
HAVING AVG(salary) > 50000;

Calculates average salary by department and keeps groups whose average is greater than 50000. fileciteturn1file0L73-L75

The script also combines row-level filtering with grouped filtering:

SELECT department, AVG(salary)
FROM EMPLOYEE
WHERE salary >= 45000
GROUP BY department
HAVING AVG(salary) > 50000;

This demonstrates WHERE before grouping and HAVING after grouping. fileciteturn1file0L77-L80

🧠 SQL Concepts Covered

Concept

Demonstrated

CREATE DATABASE / DROP DATABASE

✅

USE

✅

CREATE TABLE / DROP TABLE

✅

SHOW DATABASES / SHOW TABLES

✅

INSERT INTO

✅

SELECT

✅

WHERE

✅

IN / NOT IN

✅

COUNT()

✅

MAX() / MIN()

✅

BETWEEN

✅

IS NULL / IS NOT NULL

✅

AVG()

✅

GROUP BY

✅

HAVING

✅

🚀 How to Run

Open da_ds_may.sql in a compatible SQL environment.

Execute the database and table creation statements in the intended sequence.

Execute the INSERT statements to populate the EMPLOYEE table.

Run the SELECT queries to practice filtering and analysis.

⚠️ Warning: The script includes DROP DATABASE da_ds_may and DROP TABLE EMPLOYEE. These statements can remove database objects and their data, so use them only when intentionally resetting the project. fileciteturn1file0L1-L3 fileciteturn1file0L17-L19

📁 Repository Structure

.
├── da_ds_may.sql
└── README.md

🎯 Learning Objectives

This project is useful for practicing:

Relational database creation

Table design and primary keys

Data insertion and retrieval

Data filtering

Aggregate functions

Missing-value handling

Grouped data analysis

WHERE vs. HAVING

Basic SQL data analysis

🛠️ Technologies

SQL

Relational Database Management System (RDBMS)

📄 License

No license information is specified in the supplied SQL file. Add a license if you plan to distribute this repository publicly.
