-- Write your PostgreSQL query statement below
SELECT department, employee, salary
FROM (
    SELECT
        d.name AS department,
        e.name AS employee,
        e.salary,
        DENSE_RANK() OVER (PARTITION BY e.departmentid ORDER BY e.salary DESC) as rank
    FROM employee as e
    JOIN department AS d ON e.departmentid = d.id
)
WHERE rank <= 3;
