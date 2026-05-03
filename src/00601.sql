-- Write your PostgreSQL query statement below
WITH consecutive_groups AS (
    SELECT id, visit_date, people, id - ROW_NUMBER() OVER (ORDER BY id) AS group_id
    FROM stadium
    WHERE people >= 100
),
filtered_groups AS (
    SELECT id, visit_date, people, COUNT(*) OVER (PARTITION BY group_id) AS group_count
    FROM consecutive_groups
)
SELECT id, visit_date, people
FROM filtered_groups
WHERE group_count >= 3
ORDER BY visit_date;
