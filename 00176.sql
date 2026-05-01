-- Write your PostgreSQL query statement below
SELECT (
    SELECT salary
    FROM (
        SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) as rank
        FROM employee
    ) AS sub
    WHERE rank = 2
    LIMIT 1
) AS SecondHighestSalary;
