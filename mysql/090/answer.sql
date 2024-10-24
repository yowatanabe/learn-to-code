-- 非効率なクエリの例
SELECT
  Books.Title,
  COUNT(Loans.LoanID) AS LoanCount
FROM
  Books
  JOIN Loans ON Books.BookID = Loans.BookID
GROUP BY
  Books.Title;

-- クエリ実行計画の確認
EXPLAIN
SELECT
  Books.Title,
  COUNT(Loans.LoanID) AS LoanCount
FROM
  Books
  JOIN Loans ON Books.BookID = Loans.BookID
GROUP BY
  Books.Title;

-- インデックスを使用した最適化
CREATE INDEX idx_book_id ON Loans (BookID);

-- インデックスを活用した最適化クエリ
SELECT
  Books.Title,
  COUNT(Loans.LoanID) AS LoanCount
FROM
  Books
  JOIN Loans ON Books.BookID = Loans.BookID
GROUP BY
  Books.Title;

-- サブクエリの使用による最適化
SELECT
  Books.Title,
  LoanData.LoanCount
FROM
  Books
  JOIN (
    SELECT
      BookID,
      COUNT(LoanID) AS LoanCount
    FROM
      Loans
    GROUP BY
      BookID
  ) AS LoanData ON Books.BookID = LoanData.BookID;

-- クエリ実行計画の確認
EXPLAIN
SELECT
  Books.Title,
  COUNT(Loans.LoanID) AS LoanCount
FROM
  Books
  JOIN Loans ON Books.BookID = Loans.BookID
GROUP BY
  Books.Title;
