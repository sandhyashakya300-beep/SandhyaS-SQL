create database da_ds_may;

drop database da_ds_may;

SHOW DATABASES;

use da_ds_may;

CREATE TABLE EMPLOYEE(
empt_id int primary key ,
empt_name varchar(77) ,
gender varchar(345) ,
department varchar(33) ,
salary float 
);

show tables;

drop table EMPLOYEE;

select * from EMPLOYEE;

INSERT INTO EMPLOYEE(empt_id,empt_name,gender,department,salary)VALUE
(100,"Joong","male","acting",33444.44),

(101, "Aswin", 'male',"DS",40000),

(102, "Vaibhav", 'male',"DA",500.0),

(103, "Bhavya", 'female',"DS",60000),

(104, "Sivapriya", 'female',"DA",45000),

(105, "Ashutosh", 'male',"DS",40000),

(106, "Ariea", 'female',"DA",55000);

use da_ds_may;

select * from EMPLOYEE;

select empt_name, department from EMPLOYEE
WHERE department IN("DA","DS");

select  count(department) from EMPLOYEE
WHERE department IN("DA","DS");

select  count(department) from EMPLOYEE
WHERE department not IN("DA","DS");

select max(salary) from EMPLOYEE;

SELECT min(salary) from EMPLOYEE;

SELECT empt_name, salary from EMPLOYEE
WHERE salary between 30000 and 65000;

INSERT INTO EMPLOYEE VALUE
(107,"Pond",'male',"AI",null),
(108,"Phuwin",'male',"AI",null),
(109,"Subh", 'male',"AI",78000);

select empt_name from EMPLOYEE
WHERE salary is null;

select empt_name from EMPLOYEE
WHERE salary is not null;


select count(empt_name) from EMPLOYEE
WHERE salary is null;

select department , avg(salary) from EMPLOYEE
GROUP BY department
having avg(salary)>50000;

select department , avg(salary) from EMPLOYEE
where salary >=45000
GROUP BY department
having avg(salary)>50000;

