-- 1. 図書IDが `3` の貸出情報を取得するクエリ
SELECT
  *
FROM
  borrow_records
WHERE
  book_id = 3;

-- インデックス追加前の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  borrow_records
WHERE
  book_id = 3;

-- インデックスを追加
ALTER TABLE borrow_records ADD INDEX idx_book_id (book_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  borrow_records
WHERE
  book_id = 3;
