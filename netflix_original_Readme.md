Netflix Originals SQL Database

📌 Project Overview

This repository contains a SQL database definition for a table named
netflix_originals. The table is designed to store basic information
about Netflix original movies, including movie name, genre, runtime,
IMDb score, language, and premiere date.

The provided SQL script focuses on table creation; it does not
contain INSERT, SELECT, UPDATE, or DELETE queries.

🗂️ Database Structure

The SQL script creates the following table:

netflix_originals

Column            Data Type        Constraint   Description

movie_name      VARCHAR(233)   NOT NULL   Name of the movie
genre_ID        INT            ---          Genre identifier
genre_name      VARCHAR(233)   ---          Name of the genre
runtime         TIME           ---          Movie runtime
IMDb_score      INT            ---          IMDb score stored as an integer
language_       VARCHAR(122)   ---          Language of the movie
Premiere_date   DATE           ---          Movie premiere date

The table definition is taken directly from the supplied SQL file.
fileciteturn0file0L1-L9

🧩 SQL Query Analysis

The script uses:

CREATE TABLE netflix_originals (
    movie_name VARCHAR(233) NOT NULL,
    genre_ID INT,
    genre_name VARCHAR(233),
    runtime TIME,
    IMDb_score INT,
    language_ VARCHAR(122),
    Premiere_date DATE
);

Key points

CREATE TABLE creates a new relational database table.

movie_name is the only column explicitly marked NOT NULL, so
a movie record must have a movie name.

genre_ID stores a numeric genre identifier.

genre_name stores the corresponding genre name.

runtime uses the SQL TIME data type.

IMDb_score uses INT, so the schema represents the IMDb score
as a whole number.

language_ stores the movie language as text.

Premiere_date uses the DATE data type for the premiere date.

📊 Example Data Concept

A record in this table could conceptually contain:

movie_name       genre_ID genre_name   runtime      IMDb_score language_   Premiere_date

Example                 1 Drama        02:00:00              8 English      2026-01-15
Movie

This is an illustrative example only and is not data contained in the
supplied SQL file.

🚀 How to Use

Open a SQL database environment such as MySQL, PostgreSQL, SQL
Server, or another compatible SQL system.

Run the CREATE TABLE statement from netfix_original.sql.

Add movie records using INSERT INTO.

Query the table using SELECT statements.

Example:

SELECT *
FROM netflix_originals;

🔍 Possible Future Improvements

The supplied schema does not define a primary key or other constraints
beyond NOT NULL on movie_name. Depending on the project's
requirements, the database could later be improved by:

Adding a unique identifier or primary key.

Adding appropriate validation constraints.

Considering whether IMDb_score should support decimal values.

Adding foreign-key relationships if genres are normalized into a
separate table.

Adding sample INSERT statements for demonstration.

Adding analytical queries for movie, genre, language, runtime, IMDb
score, and premiere-date analysis.

These are recommendations for future development and are not changes
made to the supplied SQL schema.

📁 Repository Structure

.
├── netfix_original.sql
└── README.md

🎯 Project Purpose

This project provides a simple relational database structure for
organizing Netflix original movie information. It can serve as a
starting point for practicing SQL table creation, data insertion,
filtering, aggregation, and analysis.

🛠️ Technologies

SQL

Relational Database Management System (RDBMS)

📄 License

No license information is provided in the supplied SQL file. Add a
license to the repository if you intend to distribute the project
publicly.
