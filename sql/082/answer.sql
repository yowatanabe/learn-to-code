-- トランザクションの開始
START TRANSACTION;

-- 新しい注文の追加
INSERT INTO
  Orders (OrderID, ProductID, Quantity)
VALUES
  (3, 1, 3);

-- 在庫の更新
UPDATE Inventory
SET
  Stock = Stock - 3
WHERE
  ProductID = 1;

-- トランザクションのコミット
COMMIT;
