-- 非効率なクエリ
SELECT b.book_title,
       SUM(b.price * p.quantity) AS total_sales
FROM books b
JOIN purchases p ON b.book_id = p.book_id
WHERE p.purchase_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY b.book_id
ORDER BY total_sales DESC
LIMIT 5;

-- EXPLAINの確認（非効率な段階）
EXPLAIN
SELECT b.book_title,
       SUM(b.price * p.quantity) AS total_sales
FROM books b
JOIN purchases p ON b.book_id = p.book_id
WHERE p.purchase_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY b.book_id
ORDER BY total_sales DESC
LIMIT 5;

-- インデックスの最適化
ALTER TABLE purchases
ADD INDEX idx_purchase_date_book (purchase_date, book_id);

-- EXPLAINの確認（最適化後）
EXPLAIN
SELECT b.book_title,
       SUM(b.price * p.quantity) AS total_sales
FROM books b
JOIN purchases p ON b.book_id = p.book_id
WHERE p.purchase_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY b.book_id
ORDER BY total_sales DESC
LIMIT 5;
