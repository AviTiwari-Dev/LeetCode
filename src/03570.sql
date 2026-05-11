-- Write your PostgreSQL query statement below
WITH curretly_borrowed AS (
    SELECT 
        book_id, 
        COUNT(*) AS current_borrowers
    FROM 
        borrowing_records
    WHERE 
        return_date IS NULL
    GROUP BY 
        book_id
)
SELECT 
    b.book_id, 
    b.title, 
    b.author, 
    b.genre, 
    b.publication_year, 
    cb.current_borrowers
FROM 
    library_books AS b
JOIN 
    curretly_borrowed AS cb ON b.book_id = cb.book_id
WHERE 
    cb.current_borrowers = b.total_copies
ORDER BY 
    cb.current_borrowers DESC, 
    b.title ASC;
