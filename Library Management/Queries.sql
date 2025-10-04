-- Queries
-- 1. Books issued by a student
SELECT b.title, b.author FROM Issue i 
JOIN Book b ON i.book_id=b.book_id
WHERE i.student_id=1;

-- 2. Most issued book
SELECT book_id, COUNT(*) cnt FROM Issue
GROUP BY book_id ORDER BY cnt DESC LIMIT 1;

-- 3. Check availability of a book
SELECT title, available_copies FROM Book WHERE title='Java Programming';

-- 4. Books issued branch-wise
SELECT s.branch, COUNT(*) issued_count
FROM Issue i JOIN Student s ON i.student_id=s.student_id
WHERE return_date IS NULL
GROUP BY s.branch;