-- 借り手が借りた本の情報を取得するクエリ
SELECT
  Borrowers.BorrowerName,
  Books.Title,
  Books.Author,
  BorrowingRecords.BorrowDate
FROM
  BorrowingRecords
  JOIN Borrowers ON BorrowingRecords.BorrowerID = Borrowers.BorrowerID
  JOIN Books ON BorrowingRecords.BookID = Books.BookID;
