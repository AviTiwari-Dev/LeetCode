-- Write your PostgreSQL query statement below
WITH first_orders AS (
    SELECT 
        customer_id, 
        order_date, 
        customer_pref_delivery_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date ASC
        ) as row_number
    FROM delivery
)
SELECT 
    ROUND(
        AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 100.0 ELSE 0.0 END), 
        2
    ) AS immediate_percentage
FROM first_orders
WHERE row_number = 1;
