USE zepto_sql_project;

CREATE TABLE zepto_test (
    category VARCHAR(255),
    name VARCHAR(255),
    mrp DECIMAL(10,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(10,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);


SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

USE zepto_sql_project;

LOAD DATA LOCAL INFILE 'E:/STORAGE PATH/zepto_v2_fixed.csv'
INTO TABLE zepto_test
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    category,
    name,
    mrp,
    discountPercent,
    availableQuantity,
    discountedSellingPrice,
    weightInGms,
    outOfStock,
    quantity
);

ALTER TABLE zepto_test
ADD COLUMN sku_id BIGINT UNSIGNED;

DESCRIBE zepto_test;
UPDATE zepto_test zt
JOIN zepto z
    ON zt.category = z.category
    AND zt.name = z.name
    AND zt.mrp = z.mrp
    AND zt.discountPercent = z.discountPercent
    AND zt.availableQuantity = z.availableQuantity
    AND zt.discountedSellingPrice = z.discountedSellingPrice
    AND zt.weightInGms = z.weightInGms
    AND zt.outOfStock = z.outOfStock
    AND zt.quantity = z.quantity
SET zt.sku_id = z.sku_id;

SELECT
    sku_id,
    category,
    name,
    mrp,
    discountPercent,
    availableQuantity,
    discountedSellingPrice
FROM zepto_test
LIMIT 20;

-- DATA EXPLORATION

-- count of rows in zepto_test
SELECT COUNT(*) FROM zepto_test;

-- sample data upto 15 
SELECT * FROM zepto_test
LIMIT 15;

--NULL values in zepto_test
SELECT * FROM zepto_test
WHERE name is null
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto_test
ORDER BY category;

--products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto_test
GROUP BY outOfStock;

--product names present multiple times
SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto_test
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

--data cleaning

--products with price = 0
SELECT * FROM zepto_test
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto_test
WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto_test
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto_test;

--data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_test
ORDER BY discountPercent DESC
LIMIT 10;

--Q2.What are the Products with High MRP but Out of Stock

SELECT DISTINCT name,mrp
FROM zepto_test
WHERE outOfStock = FALSE and mrp > 300
ORDER BY mrp DESC;

--Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto_test
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_test
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_test
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto_test
WHERE weightInGms >= 100
ORDER BY price_per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto_test;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto_test
GROUP BY category
ORDER BY total_weight;

--COMPLETE SQL PROJECT 