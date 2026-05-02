-- Write your PostgreSQL query statement below

SELECT name
FROM employee
WHERE id IN (
    SELECT managerId
    FROM employee
    GROUP BY managerid
    HAVING COUNT(id) >= 5
);
