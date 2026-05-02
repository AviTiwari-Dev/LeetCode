-- Write your PostgreSQL query statement below
SELECT e.name as employee
FROM employee as e
JOIN employee as m ON e.managerid = m.id 
WHERE e.salary > m.salary;
