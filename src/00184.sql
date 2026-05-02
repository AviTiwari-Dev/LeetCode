-- Write your PostgreSQL query statement below
SELECT department, employee, salary
FROM (
    SELECT
        d.name AS department,
        e.name AS employee,
        e.salary,
        DENSE_RANK() OVER(PARTITION BY e.departmentid ORDER BY e.salary DESC) AS rank
    FROM employee AS e
    JOIN department AS d ON e.departmentid = d.id
)
WHERE rank = 1;
