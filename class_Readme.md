Faculty Database SQL Project

A beginner-friendly SQL practice project that demonstrates how to create a database table, insert faculty records, update data, alter a table, and retrieve records using filtering and aggregate queries.

📌 Project Overview

This project focuses on basic SQL database operations using a faculty table. The table stores information about faculty members, including their department, ID, name, experience, and salary.

The SQL script demonstrates the following concepts:

Database selection

Table creation

Primary keys

Data insertion

Data updating

Altering an existing table

Selecting specific records

Counting records

Filtering records with conditions

🗂️ Database Structure

The script uses the sandhya database and creates a table named faculty.

Faculty Table

Column

Data Type

Constraint / Purpose

f_department

VARCHAR(232)

Faculty department

f_id

INT

Primary key and unique faculty ID

f_name

VARCHAR(344)

Faculty member's name

f_experience

INT

Years of experience

f_salary

INT

Faculty salary

Std_id

INT

Added later using ALTER TABLE

The initial table definition establishes f_id as the primary key. fileciteturn0file0L4-L9

📊 Sample Data

The script inserts 10 faculty records covering departments such as Computer Science, Information Technology, Electronic, Artificial Intelligence, BBA, Mathematics, BCA, and MBA. fileciteturn0file0L13-L23

Example records include:

Dr. Sachin — Computer Science — 10 years — 90,000 salary

Dr. Ram — Information Technology — 8 years — 80,000 salary

Dr. Rajan — Electronic — 7 years — 78,000 salary

Mr. Roshan — Artificial Intelligence — 9 years — 89,000 salary

Miss Sana — Mathematics — 15 years — 120,000 salary

🔧 SQL Operations Demonstrated

1. Select the Database

USE sandhya;

The script selects the sandhya database before performing the table operations. fileciteturn0file0L1-L1

2. Create the Faculty Table

CREATE TABLE faculty(
    f_department VARCHAR(232),
    f_id INT PRIMARY KEY,
    f_name VARCHAR(344),
    f_experience INT,
    f_salary INT
);

This creates the main faculty table and defines f_id as its primary key. fileciteturn0file0L4-L10

3. Insert Faculty Records

INSERT INTO faculty
(f_department, f_id, f_name, f_experience, f_salary)
VALUES
('Computer Science', 101, 'Dr.Sachin', 10, 90000);

The full script inserts 10 faculty records. fileciteturn0file0L13-L23

4. Update a Record

UPDATE faculty
SET f_salary = 87000
WHERE f_id = 105;

This changes the salary of the faculty member whose ID is 105 to 87,000. fileciteturn0file0L25-L25

5. Retrieve All Records

SELECT * FROM faculty;

The script uses this query to display the current contents of the table. fileciteturn0file0L25-L26

6. Add a New Column

ALTER TABLE faculty
ADD Std_id INT;

This modifies the existing table by adding a new integer column named Std_id. fileciteturn0file0L28-L29

7. Find a Faculty Member by ID

SELECT * FROM faculty
WHERE f_id = 106;

This retrieves the record associated with faculty ID 106. fileciteturn0file0L31-L31

8. Count Faculty Records

SELECT COUNT(*) FROM faculty;

This counts the rows currently stored in the faculty table. fileciteturn0file0L33-L33

9. Filter by Salary

SELECT * FROM faculty
WHERE f_salary > 80000;

This returns faculty members whose salary is greater than 80,000. fileciteturn0file0L35-L36

🧠 SQL Concepts Covered

Concept

SQL Feature

Database selection

USE

Table creation

CREATE TABLE

Primary key

PRIMARY KEY

Data insertion

INSERT INTO

Data modification

UPDATE

Table modification

ALTER TABLE ... ADD

Data retrieval

SELECT

Conditional filtering

WHERE

Aggregate function

COUNT(*)

▶️ How to Run

Install a SQL-compatible database system such as MySQL.

Open MySQL Workbench, a SQL client, or your preferred SQL environment.

Open class.sql.

Select/run the script.

Execute the queries individually if you want to observe the result of each operation.

Note: The script uses MySQL-style SQL syntax. Exact behavior can vary between database systems.

📁 Project Structure

faculty-sql-project/
│
├── class.sql
└── README.md

📈 Learning Outcomes

After completing this project, you can demonstrate practical understanding of:

Creating relational database tables

Defining a primary key

Inserting multiple records

Updating existing records

Adding columns to an existing table

Retrieving records with SELECT

Filtering data with WHERE

Using COUNT() for basic aggregation

🔍 Notes and Possible Improvements

This is a basic SQL practice project, so there are opportunities to extend it:

Add NOT NULL constraints where appropriate.

Add checks for valid salary and experience values.

Use more descriptive or consistent naming conventions.

Populate Std_id with meaningful values if the column is required.

Add queries using ORDER BY, GROUP BY, AVG(), MAX(), and MIN().

Create additional tables for students, courses, or departments and practice JOIN operations.

Add comments to the SQL file explaining each section.

👩‍💻 Author

Sandhya Shakya

This project was created as SQL class/practice work to build hands-on experience with fundamental database operations.

⭐ GitHub Repository

If you found this project useful, feel free to star the repository and explore the SQL concepts demonstrated in class.sql.
