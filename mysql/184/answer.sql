-- 1. 各書籍の貸出記録を取得するクエリ
SELECT
    b.title,
    b.author,
    r.borrower_name,
    r.borrow_date,
    r.return_date
FROM
    books b
    JOIN borrow_records r ON b.book_id = r.book_id
ORDER BY
    b.title,
    r.borrow_date;

-- 2. 書籍削除後の貸出記録確認クエリ
-- 書籍 "1984" を削除
DELETE FROM books
WHERE
    title = '1984';

-- 残っている貸出記録を確認
SELECT
    *
FROM
    borrow_records;
