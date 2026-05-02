-- Write your PostgreSQL query statement below
SELECT id
FROM (
    SELECT
        *,
        LAG(temperature) OVER (ORDER BY recorddate ASC) AS previous_temp,
        LAG(recorddate) OVER (ORDER BY recorddate ASC) AS previous_date
    FROM weather
)
WHERE
    temperature > previous_temp
    AND
    recorddate = previous_date + INTERVAL '1 day';
