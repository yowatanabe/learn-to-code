-- 確認
SELECT
  *
FROM
  Products;

-- トランザクションの開始
BEGIN;

-- Laptop の在庫から注文数を減らす
UPDATE Products
SET
  Stock = Stock - 2
WHERE
  ProductID = 1;

-- Mouse の在庫から注文数を減らす
UPDATE Products
SET
  Stock = Stock - 1
WHERE
  ProductID = 2;

-- Monitor の在庫から注文数を減らす（在庫不足）
UPDATE Products
SET
  Stock = Stock - 10
WHERE
  ProductID = 4;

-- すべての操作が成功した場合にコミットする
COMMIT;

-- 確認
SELECT
  *
FROM
  Products;

-- 確認
SELECT
  *
FROM
  Products;

-- トランザクションの開始
BEGIN;

-- Laptop の在庫から注文数を減らす
UPDATE Products
SET
  Stock = Stock - 2
WHERE
  ProductID = 1;

-- Mouse の在庫から注文数を減らす
UPDATE Products
SET
  Stock = Stock - 1
WHERE
  ProductID = 2;

-- Monitor の在庫から注文数を減らす（在庫不足）
UPDATE Products
SET
  Stock = Stock - 10
WHERE
  ProductID = 4;

-- Monitor の在庫が不足によるロールバック
ROLLBACK;

-- 確認
SELECT
  *
FROM
  Products;
