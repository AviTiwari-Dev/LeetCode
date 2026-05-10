-- Write your PostgreSQL query statement below
SELECT user_id, email
FROM users
WHERE email ~ '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$'
ORDER BY user_id;
