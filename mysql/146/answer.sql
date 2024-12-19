-- 非効率なクエリ
SELECT b.title, COUNT(l.loan_id) AS loan_count
FROM books b
JOIN loans l ON b.book_id = l.book_id
WHERE l.loan_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY b.book_id
ORDER BY loan_count DESC
LIMIT 5;

-- EXPLAINの確認（初期状態）
EXPLAIN
SELECT b.title, COUNT(l.loan_id) AS loan_count
FROM books b
JOIN loans l ON b.book_id = l.book_id
WHERE l.loan_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY b.book_id
ORDER BY loan_count DESC
LIMIT 5;

-- インデックスの最適化
ALTER TABLE loans
ADD INDEX idx_book_loan_date (book_id, loan_date);

-- EXPLAINの確認（最適化後）
EXPLAIN
SELECT b.title, COUNT(l.loan_id) AS loan_count
FROM books b
JOIN loans l ON b.book_id = l.book_id
WHERE l.loan_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY b.book_id
ORDER BY loan_count DESC
LIMIT 5;
