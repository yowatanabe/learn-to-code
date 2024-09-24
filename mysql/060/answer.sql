-- サブクエリを使って、Aliceが借りた書籍のタイトルと価格を表示するクエリ
SELECT
  Title,
  Price
FROM
  Books
WHERE
  BookID IN (
    SELECT
      BookID
    FROM
      BorrowedBooks
    WHERE
      BorrowerName = 'Borrower A'
  );

-- 最も高価な書籍を借りた借主の名前を取得するクエリ
SELECT
  BorrowerName
FROM
  BorrowedBooks
WHERE
  BookID = (
    SELECT
      BookID
    FROM
      Books
    ORDER BY
      Price DESC
    LIMIT
      1
  );
