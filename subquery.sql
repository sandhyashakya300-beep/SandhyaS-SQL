use da_ds_may;
show TABLES;

#subquery


SELECT name from customers
WHERE customer_id = (SELECT customer_id from orders
WHERE order_id = 101);

SELECT name from customers 
WHERE customer_id in (SELECT customer_id from orders);

select name from customers c
WHERE EXISTS(SELECT 1 
FROM orders o
WHERE o.customer_id = c.customer_id);

SELECT c.name , (SELECT COUNT(*) FROM orders o
WHERE  o.customer_id = c.customer_id) as customer_cnt
FROM customers c;

SELECT c.name , count(order_id)as order_cnt
from customers c
left join orders o 
ON c.customer_id = o.customer_id
group by c.name
order by order_cnt desc ;

CREATE TABLE Cust (

    customer_id INT PRIMARY KEY,

    customer_name VARCHAR(50),

    city VARCHAR(50)

    );

    

INSERT INTO Cust VALUES

(101,'Rahul','Delhi'),

(102,'Priya','Mumbai'),

(103,'Amit','Delhi'),

(104,'Sneha','Chennai'),

(105,'Karan','Mumbai'),

(106,'Pooja','Bangalore');


CREATE TABLE Ord (

    order_id INT PRIMARY KEY,

    customer_id INT,

    order_date DATE,

    amount INT

);

 

INSERT INTO Ord VALUES

(1,101,'2024-01-10',1200),

(2,101,'2024-02-15',2200),

(3,102,'2024-01-05',3500),

(4,103,'2024-03-11',1800),

(5,104,'2024-01-25',4500),

(6,102,'2024-02-20',2700),

(7,105,'2024-04-01',6000),

(8,103,'2024-02-14',2400),

(9,104,'2024-03-19',5200),

(10,106,'2024-03-10',3000),

(11,105,'2024-04-15',6500),

(12,101,'2024-04-18',7000);

#answer 1
SELECT customer_id, SUM(amount) AS total_purchase
FROM Ord
GROUP BY customer_id
HAVING SUM(amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(amount) AS customer_total
        FROM Ord
        GROUP BY customer_id
    )as subquery
);
#answer 2
SELECT DISTINCT customer_id
FROM Ord
WHERE amount = (SELECT MAX(amount) FROM Ord);

#answer3
SELECT order_id, customer_id, order_date, amount
FROM Ord
WHERE amount > (SELECT AVG(amount) FROM Ord);



