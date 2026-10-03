Car Service Center SQL Database

A beginner-friendly SQL database project for managing car service
records and vehicle owners. The script creates a Car_Service_center
database, stores service information for 20 vehicles, creates an owner
table, inserts owner records, and demonstrates common SQL operations
such as SELECT, WHERE, LIKE, ALTER TABLE, UPDATE, and
INNER JOIN.

Project Overview

This project models a simple car service center database with two main
tables:

car_service --- stores vehicle and service information.

owner --- stores vehicle owner information and links each
owner to a car through car_id.

The SQL script uses sample records covering different car brands,
models, service types, fuel types, mechanics, dates, colors, and engine
types.

Database Structure

1. car_service table

The database and main table are created with:

CREATE DATABASE Car_Service_center;
USE Car_Service_center;

The car_service table contains the following columns:

Column                  Data Type               Description

car_id                INT                   Unique identifier for
each car; primary key

car_name              VARCHAR(344)          Car manufacturer/brand

car_model             VARCHAR(333)          Car model

service_type          VARCHAR(455)          Type of service
performed

service_date          DATE                  Date of service;
required

mechanic_name         VARCHAR(322)          Mechanic who performed
the service

service_cost          DECIMAL(10,2)         Cost of the service

fuel_type             VARCHAR(23)           Fuel/vehicle energy
type

car_color             VARCHAR(34)           Vehicle color

car_number            VARCHAR(20)           Vehicle registration
number

engine_type           TEXT                  Engine or motor type

The service_date column is defined as NOT NULL, while car_id is
the primary key. fileciteturn0file0L5-L16

2. owner table

The owner table stores owner information:

Column         Data Type        Description

owner_id     INT            Unique owner identifier; primary key
car_id       INT            Identifier of the associated car
owner_name   VARCHAR(366)   Name of the vehicle owner
DOB          INT            Added later using ALTER TABLE

The initial table definition contains owner_id, car_id, and
owner_name. fileciteturn0file0L56-L60

Sample Data

The project inserts 20 car service records with service dates from
September 1, 2026 through September 20, 2026. Examples include:

Toyota Corolla --- Battery Replacement

Hyundai i20 --- Oil Change

Maruti Suzuki Swift --- Wheel Alignment

Honda City --- AC Service

Ford EcoSport --- Brake Pad Replacement

Volkswagen Polo --- Engine Tuning

Tata Nexon --- Full Wash & Polish

BMW 3 Series --- General Inspection

The service costs in the sample data range from 15.00 to 420.00.
fileciteturn0file0L20-L53

The owner table contains 20 owner records and associates each owner with
a car_id. fileciteturn0file0L63-L84

SQL Operations Demonstrated

Retrieve all owners

SELECT * FROM owner;

This displays all records from the owner table.
fileciteturn0file0L86-L86

Add a column with ALTER TABLE

ALTER TABLE owner ADD DOB INT;

The script demonstrates modifying an existing table by adding a DOB
column. fileciteturn0file0L88-L88

Update a record

UPDATE owner
SET DOB = 1990
WHERE owner_id = 101;

This updates the DOB value for owner 101.
fileciteturn0file0L92-L92

Filter records using LIKE

SELECT *
FROM owner
WHERE owner_name LIKE 'R%';

This searches for owners whose names begin with the letter R.
fileciteturn0file0L98-L99

Combine owner and car information

The script demonstrates two ways of combining the owner and service
tables.

Using the older comma-join style:

SELECT *
FROM owner o, car_service cs
WHERE o.car_id = cs.car_id;

And using an explicit INNER JOIN:

SELECT *
FROM owner o
INNER JOIN car_service cs
    ON o.car_id = cs.car_id;

Both queries use the matching car_id values to combine owner and
vehicle/service information. fileciteturn0file0L102-L106

SQL Concepts Covered

This project demonstrates several foundational SQL concepts:

Database creation

Selecting a database with USE

Table creation with CREATE TABLE

Primary keys

Data insertion with INSERT INTO

Retrieving data with SELECT

Filtering with WHERE

Pattern matching with LIKE

Updating records with UPDATE

Modifying table structure with ALTER TABLE

Table aliases

Joining tables with INNER JOIN

DECIMAL values for service costs

DATE values for service records

Important Notes About the Current Script

The script is useful for practicing SQL, but there are a few areas that
could be improved for a production-style database.

1. Add a foreign key relationship

owner.car_id is used to connect owners with cars, but the current
script does not explicitly declare it as a foreign key.

A stronger design could include:

FOREIGN KEY (car_id) REFERENCES car_service(car_id)

This would enforce referential integrity between the two tables.

2. Improve data types and lengths

Several VARCHAR sizes are much larger than the sample values require,
for example:

car_name VARCHAR(344)
car_model VARCHAR(333)
service_type VARCHAR(455)

For a real database, these sizes could be reduced according to expected
data requirements.

3. Reconsider the DOB data type

The script adds:

DOB INT

and stores 1990 as the value. This represents a birth year, rather
than a complete date of birth. If the intention is to store an actual
date of birth, a DATE column would be more appropriate.

4. Review the average calculation

The script contains:

SELECT AVG(car_model) FROM car_service;

car_model contains text values such as Corolla, i20, and Swift,
so calculating an average of this column is not meaningful. If the goal
is to calculate the average service cost, the query should instead use:

SELECT AVG(service_cost)
FROM car_service;

5. Prefer explicit JOIN syntax

The script contains both comma-style joining and INNER JOIN. The
explicit INNER JOIN version is generally clearer and makes the
relationship between tables easier to understand.

How to Run

Install a MySQL-compatible database system such as MySQL.

Open MySQL Workbench, the MySQL command-line client, or another SQL
editor.

Open the SQL file from this repository.

Execute the script.

Verify the database:

USE Car_Service_center;
SELECT * FROM car_service;
SELECT * FROM owner;

Example Project Queries

After loading the data, you can practice additional queries such as:

Find all petrol cars

SELECT *
FROM car_service
WHERE fuel_type = 'Petrol';

Find services costing more than 100

SELECT *
FROM car_service
WHERE service_cost > 100;

Sort services by cost

SELECT *
FROM car_service
ORDER BY service_cost DESC;

Find services performed by John Doe

SELECT *
FROM car_service
WHERE mechanic_name = 'John Doe';

Calculate total service revenue

SELECT SUM(service_cost) AS total_service_cost
FROM car_service;

Calculate average service cost

SELECT AVG(service_cost) AS average_service_cost
FROM car_service;

Display owner and vehicle details together

SELECT
    o.owner_name,
    cs.car_name,
    cs.car_model,
    cs.service_type,
    cs.service_date,
    cs.service_cost
FROM owner o
INNER JOIN car_service cs
    ON o.car_id = cs.car_id;

Suggested Repository Structure

car-service-center-sql/
│
├── class_2.sql
└── README.md

Learning Objectives

By working with this project, you can practice:

Designing basic relational database tables.

Creating and populating SQL databases.

Working with primary keys.

Filtering and searching records.

Updating existing data.

Modifying table structures.

Joining related tables.

Working with dates and decimal values.

Identifying inappropriate data types or SQL operations.

Writing queries for basic car-service business analysis.

Technologies

SQL

MySQL / MySQL-compatible database

Relational Database Concepts

Conclusion

This project provides a practical introduction to SQL using a Car
Service Center scenario. It combines vehicle service information with
owner records and demonstrates core database operations, making it
suitable as a learning project or beginner SQL portfolio repository.

Future improvements could include separate tables for customers,
vehicles, mechanics, services, and payments, along with foreign-key
constraints and more advanced analytical queries.
