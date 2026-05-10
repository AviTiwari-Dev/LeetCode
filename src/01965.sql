-- Write your PostgreSQL query statement below
SELECT COALESCE(e.employee_id, s.employee_id) AS employee_id
FROM employees e
FULL OUTER JOIN salaries s ON e.employee_id = s.employee_id
WHERE e.name IS NULL OR s.salary IS NULL
ORDER BY employee_id;
