CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    SELECT MAX(sub.salary)
    FROM (
        SELECT
            employee.salary,
            DENSE_RANK() OVER(ORDER BY employee.salary DESC) AS rank
        FROM employee
    ) AS sub
    WHERE sub.rank = N
  );
END;
$$ LANGUAGE plpgsql;
