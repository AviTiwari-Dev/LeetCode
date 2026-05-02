-- Write your PostgreSQL query statement below

WITH cte_ranked_customer AS (
    SELECT
        customer_number,
        DENSE_RANK() OVER(ORDER BY COUNT(order_number) DESC) AS rank
    FROM orders
    GROUP BY customer_number
)

SELECT customer_number
FROM cte_ranked_customer
WHERE rank = 1;
