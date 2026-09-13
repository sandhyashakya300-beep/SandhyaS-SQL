use da_ds_may;
CREATE TABLE customers (

customer_id INT,

name VARCHAR(50),

city VARCHAR(50)
);

 

INSERT INTO Customers VALUES

(1, 'Alice', 'Mumbai'),

(2, 'Bob', 'Delhi'),

(3, 'Charlie', 'Bangalore'),

(4, 'David', 'Pune');


CREATE TABLE Orders (

 order_id INT,

 customer_id INT,

 amount INT,

 order_date DATE

);

INSERT INTO Orders VALUES

(101, 1, 500, '2024-01-01'),

(102, 2, 1000, '2024-01-02'),

(103, 1, 700, '2024-01-03'),

(104, 3, 300, '2024-01-04');

select * from Orders;

CREATE TABLE Payments (

 payment_id INT,

 order_id INT,

 payment_method VARCHAR(20)

);

INSERT INTO Payments VALUES

(1, 101, 'UPI'),

(2, 102, 'Card'),

(3, 103, 'Cash');

select * from Payments;

show tables;

INSERT INTO Orders VALUES

(105, 5, 2000, '2024-01-01'),

(106, 6, 10000, '2024-01-02');

INSERT INTO Customers VALUES

(5, 'Ice_cream', 'Tamil Nadu'),

(6, 'Aman', 'Delhi'),

(7, 'Sandhya', 'Bangalore');

INSERT INTO Orders VALUES

(118, 95, 2000, '2024-01-01'),

(119, 96, 10000, '2024-01-02');

INSERT INTO Orders VALUES

(121, 101, null, '2024-01-01'),

(122, 102, null, '2024-01-02'),

(123, 103, null, '2024-01-02');

select c.name , o.order_id,o.amount from customers as c
INNER JOIN orders as o on c.customer_id = o.customer_id;

select c.name , o.order_id,o.amount from customers as c
 JOIN orders as o on c.customer_id = o.customer_id
 WHERE o.amount >= 500
 order by o.amount DESC;
 
 select c.name,o.order_id,SUM(o.amount) AS Total_amt
 from customers as c
 JOIN orders as o on c.customer_id = o.customer_id
 WHERE o.amount >= 500
 GROUP BY c.name , o.order_id
 order by Total_amt DESC;
 
  
 select DISTINCT(c.name),SUM(o.amount) AS Total_amt
 from customers as c
 JOIN orders as o on c.customer_id = o.customer_id
 WHERE o.amount >= 500
 GROUP BY c.name 
 order by Total_amt DESC;
 
select c.name , o.order_id
from customers as c
LEFT JOIN orders as o 
on c.customer_id = o.customer_id;

select c.name , o.order_id
from customers as c
RIGHT JOIN orders as o 
on c.customer_id = o.customer_id;


select c.name , o.order_id,o.amount
from customers as c
LEFT JOIN orders as o 
on c.customer_id = o.customer_id
UNION
select c.name , o.order_id,o.amount
from customers as c
RIGHT JOIN orders as o 
on c.customer_id = o.customer_id;

SELECT order_id from orders
WHERE amount is null;

CREATE TABLE Employees_n (

 emp_id INT,

 name VARCHAR(50),

 manager_id INT

);

INSERT INTO Employees_n VALUES

(1, 'A', NULL),

(2, 'B', 1),

(3, 'C', 1),

(4, 'D', 2);

SELECT * from Employees_n;

SELECT e.name AS Employee,m.name as Manager 
FROM Employees_n as e
LEFT JOIN Employees_n as m 
ON e.Manager_id = m.emp_id;

SELECT c.name,o.order_id,p.payment_method
from customers as c
join orders as o
on c.customer_id = o.customer_id
join payments as p
on o.order_id = p.order_id;




