-- Write your PostgreSQL query statement below
WITH all_friendships AS (
    SELECT requestaccepted.requester_id AS id FROM requestaccepted
    UNION ALL
    SELECT requestaccepted.accepter_id AS id FROM requestaccepted
),
friend_counts AS (
    SELECT
        id,
        COUNT(*) as num,
        DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
    FROM all_friendships
    GROUP BY id
)
SELECT id, num
FROM friend_counts
WHERE rank = 1;
