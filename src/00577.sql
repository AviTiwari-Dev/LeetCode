-- Write your PostgreSQL query statement below
SELECT employee.name, bonus.bonus
FROM employee
LEFT JOIN bonus on employee.empid = bonus.empid
WHERE (bonus.bonus < 1000) OR (bonus.bonus IS NULL);
