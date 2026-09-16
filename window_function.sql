#WINDOW FUNCTION
#basic syntax : function() over(partition by  order by)

SELECT amount,
ROW_NUMBER() OVER(ORDER BY amount desc) as index_val
from orders;

SELECT amount,
RANK() OVER(ORDER BY amount desc) as RNK
from orders;

SELECT amount,
DENSE_RANK() OVER(ORDER BY amount desc) as DRNK
from orders;

SELECT amount,
ROW_NUMBER() OVER(ORDER BY amount desc) as index_val,
RANK() OVER(ORDER BY amount desc) as RNK,
DENSE_RANK() OVER(ORDER BY amount desc) as DRNK
from orders;

SELECT customer_id, amount,
RANK() OVER(ORDER BY amount desc) as RNK
from orders;

select distinct order_date,
sum(amount) over(order by order_date) as run_total
from orders;

-- find customers whose total purchases exceeds 8000
use da_ds_may;
with cust_sales AS(
SELECT customer_id, sum(amount) AS total_sales from ord
GROUP BY customer_id
)
SELECT * from cust_sales
where total_sales > 8000;

-- find total purchase of every customers
with customersales as(
SELECT customer_id, sum(amount) AS total_sales from ord
GROUP BY customer_id
)
SELECT * FROM customersales;






