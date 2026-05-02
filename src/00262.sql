-- Write your PostgreSQL query statement below
WITH unbanned_users AS (
    SELECT users_id
    FROM users
    WHERE banned = 'No'
),
valid_trips AS (
    SELECT status, request_at
    FROM trips
    WHERE
        client_id IN (SELECT users_id FROM unbanned_users)
        AND driver_id IN (SELECT users_id FROM unbanned_users)
        AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
)

SELECT
    request_at AS "day",
    ROUND(
        COUNT(CASE WHEN status != 'completed' THEN 1 END)::DECIMAL/COUNT(*),
        2
    ) AS "cancellation rate"
FROM valid_trips
GROUP BY request_at;
