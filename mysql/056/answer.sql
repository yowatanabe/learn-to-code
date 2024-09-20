-- 1. 合計で5回以上注文された書籍のタイトルと著者名を取得するSQL文
SELECT
  title,
  author
FROM
  books
WHERE
  book_id IN (
    SELECT
      book_id
    FROM
      orders
    GROUP BY
      book_id
    HAVING
      SUM(quantity) >= 5
  );

-- 2. 在庫がゼロの書籍を注文した顧客の名前を取得するSQL文
SELECT DISTINCT
  customer_name
FROM
  orders
WHERE
  book_id IN (
    SELECT
      book_id
    FROM
      books
    WHERE
      stock = 0
  );
