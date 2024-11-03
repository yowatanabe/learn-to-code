-- 確認
SELECT
  *
FROM
  Products;

SELECT
  *
FROM
  Orders;

-- トランザクションの開始
BEGIN;

-- 在庫から Laptop を 20 台減算（在庫が不足する場合）
UPDATE Products
SET
  Stock = Stock - 20
WHERE
  ProductID = 2;

-- Orders テーブルに新規注文を追加
INSERT INTO
  Orders (OrderID, ProductID, Quantity, OrderDate)
VALUES
  (1003, 2, 20, '2024-10-07');

-- エラーが発生した場合にロールバック
ROLLBACK;

-- 確認
SELECT
  *
FROM
  Products;

SELECT
  *
FROM
  Orders;

-- トランザクションの開始
BEGIN;

-- 在庫から Laptop を 5 台減算
UPDATE Products
SET
  Stock = Stock - 5
WHERE
  ProductID = 2;

-- Orders テーブルに新規注文を追加
INSERT INTO
  Orders (OrderID, ProductID, Quantity, OrderDate)
VALUES
  (1002, 2, 5, '2024-10-06');

-- すべての操作が成功した場合のみコミット
COMMIT;

-- 確認
SELECT
  *
FROM
  Products;

SELECT
  *
FROM
  Orders;
