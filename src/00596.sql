-- Write your PostgreSQL query statement below
SELECT class
FROM (
    SELECT COUNT(student) AS student_count, class
    FROM courses
    GROUP BY class
)
WHERE student_count >= 5;
