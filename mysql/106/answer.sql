-- パフォーマンス最適化されたトランザクション
-- 1つのトランザクションで複数の商品の在庫を更新し、注文をバッチで挿入します。これにより、個別更新のオーバーヘッドが減り、トランザクションの速度が向上します。
-- この方法により、データベースの負荷が軽減され、トランザクションが短時間で完了するため、ロックの競合を減らし、全体的なスループットが向上します。

-- トランザクションの開始
BEGIN;

-- 複数商品の在庫をまとめて減算
UPDATE Products
SET
  Stock = CASE
    WHEN ProductID = 1 THEN Stock - 2 -- Laptop
    WHEN ProductID = 2 THEN Stock - 3 -- Mouse
    WHEN ProductID = 3 THEN Stock - 1 -- Keyboard
    ELSE Stock
  END
WHERE
  ProductID IN (1, 2, 3);

-- 注文履歴にバッチ挿入
INSERT INTO
  Orders (ProductID, Quantity, OrderDate)
VALUES
  (1, 2, CURDATE()),
  (2, 3, CURDATE()),
  (3, 1, CURDATE());

COMMIT;
