Student Course Management System – SQL

📌 Project Overview

This project is a beginner-friendly SQL database project that demonstrates how to create and populate a student course management database. The script creates a database named student_course_do, defines a students_info table, inserts student records, and retrieves the stored data.

The SQL file is useful for practicing database creation, table design, constraints, data insertion, and basic SELECT queries.

🎯 Objectives

Create a dedicated student-course database.

Design a student information table.

Apply primary-key and uniqueness constraints.

Store student contact, course, birth-date, and registration information.

Insert multiple student records.

Retrieve and inspect table data.

🗄️ Database Structure

Database

CREATE DATABASE student_course_do;
USE student_course_do;

Table: students_info

Column

Data Type

Constraint

Description

student_id

INT

Primary Key

Unique identifier for each student

student_name

VARCHAR(243)

NOT NULL

Student's name

email_id

VARCHAR(456)

UNIQUE, NOT NULL

Student email address

phone_number

BIGINT

UNIQUE

Student phone number

course_name

VARCHAR(244)

—

Enrolled course

date_of_birth

DATE

—

Student's date of birth

registration_date

DATETIME

—

Date and time of registration

The table definition and its constraints are specified in the source SQL file. fileciteturn5file0L7-L14

🔑 SQL Concepts Demonstrated

1. Database Creation

The script creates and selects the project database before working with the table.

CREATE DATABASE student_course_do;
USE student_course_do;

2. Table Creation

The students_info table stores the core information required for the student management example.

3. Constraints

The project demonstrates several important SQL constraints:

PRIMARY KEY – ensures each student_id identifies a unique student.

NOT NULL – requires student_name and email_id to have values.

UNIQUE – prevents duplicate email addresses and phone numbers.

4. Data Insertion

Multiple student records are inserted using a single INSERT INTO statement. The dataset contains student IDs from 100 through 120, with course, birth-date, and registration information. fileciteturn5file0L20-L41

5. Data Retrieval

The script uses:

SELECT * FROM students_info;

to display the records stored in the table. fileciteturn5file0L43-L43

It also uses SHOW TABLES to inspect the tables available in the selected database. fileciteturn5file0L16-L16

📊 Dataset

The sample dataset includes students enrolled in courses such as:

Artificial Intelligence

Machine Learning

Information Technology

Computer Science

Data Science

The SQL file contains 21 inserted student records. Some early sample records use different formatting and naming from the later records, making the dataset suitable for basic data-quality practice as well. fileciteturn5file0L20-L41

⚠️ Data Quality Notes

The source data contains a few values that you may want to clean in a future version of the project. For example, one course value is written as Artifical Intelligencee, while other records use Artificial Intelligence. There are also different styles of names, email addresses, phone numbers, and registration dates in the sample data. fileciteturn5file0L21-L29

These are observations from the provided dataset, not changes made to the original SQL script.

▶️ How to Run

Install a MySQL-compatible database system such as MySQL Server and a SQL client.

Open the SQL file:

student_course_do.sql

Execute the script.

The script will:

Create the student_course_do database.

Select the database.

Create the students_info table.

Display the available tables.

Insert the sample student records.

Display all student records.

📁 Repository Structure

student-course-management/
│
├── student_course_do.sql
└── README.md

🛠️ Technologies

SQL

MySQL

📚 Learning Outcomes

After working through this project, you can practice:

Creating databases and tables

Selecting a database with USE

Defining columns and data types

Applying PRIMARY KEY, UNIQUE, and NOT NULL

Inserting multiple rows

Viewing table data with SELECT

Inspecting tables with SHOW TABLES

Identifying basic data-quality issues

🚀 Possible Future Improvements

The current script focuses on one student table. A larger student course management system could be extended with:

Separate courses and enrollments tables

Foreign-key relationships

Instructor information

Course fees and payment records

Student attendance

Grades and examination results

Queries using JOIN, GROUP BY, aggregate functions, and subqueries

Data validation and normalization

👤 Project Purpose

This repository is intended as a SQL learning and practice project for understanding the fundamentals of database and student information management.

📄 License

This project is provided for educational and learning purposes. Add a specific open-source license if you plan to distribute the repository publicly.
