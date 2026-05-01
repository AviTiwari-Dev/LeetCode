-- Write your PostgreSQL query statement below
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num,
    LAG(num) OVER (ORDER BY id) AS previous_num,
    LEAD(num) OVER (ORDER BY id) AS next_num
    FROM logs
) AS sub
WHERE num = previous_num and num = next_num;
