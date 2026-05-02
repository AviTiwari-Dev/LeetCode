-- Write your PostgreSQL query statement below
WITH first_login AS (
    SELECT
        player_id,
        MIN(event_date) AS first_date
    FROM activity
    GROUP BY player_id
)

SELECT
    ROUND (
        COUNT(activity.player_id)::DECIMAL / (SELECT COUNT(DISTINCT player_id) FROM activity),
        2
    ) AS fraction
FROM first_login
JOIN activity
ON
    activity.player_id = first_login.player_id
    AND
    activity.event_date = first_login.first_date + INTERVAL '1 day';
