-- Write your PostgreSQL query statement below
SELECT employeeuni.unique_id, employees.name
FROM employees
LEFT JOIN employeeuni ON employees.id = employeeuni.id;
