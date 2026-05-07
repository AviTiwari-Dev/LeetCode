-- Write your PostgreSQL query statement below
SELECT 
    machine_id,
    ROUND(
        (SUM(CASE WHEN activity_type = 'end' THEN timestamp ELSE -timestamp END) 
        / (COUNT(DISTINCT process_id)))::NUMERIC, 
        3
    ) AS processing_time
FROM activity
GROUP BY machine_id;
