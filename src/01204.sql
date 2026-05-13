-- Write your PostgreSQL query statement below
WITH cumulative_weight AS (
    SELECT 
        person_name,
        weight,
        SUM(weight) OVER (ORDER BY turn ASC) AS total_weight
    FROM queue
)
SELECT person_name
FROM cumulative_weight
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;
