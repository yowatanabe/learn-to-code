-- トランザクションの開始
START TRANSACTION;

-- 新しい借用の追加
INSERT INTO
  BorrowedBooks (BorrowID, BookID, BorrowerID, BorrowDate)
VALUES
  (3, 1, 3, '2024-07-10');

-- 在庫の更新
UPDATE Books
SET
  Quantity = Quantity - 1
WHERE
  BookID = 1;

-- トランザクションのコミット
COMMIT;
