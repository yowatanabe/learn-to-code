-- 1. 非効率なクエリの例
-- 次のクエリは商品名とその売上数を取得するために`JOIN` を使用しているが、テーブルのフルスキャンが発生します。
SELECT
  Products.ProductName,
  SUM(Orders.Quantity) AS TotalSales
FROM
  Products
  JOIN Orders ON Products.ProductID = Orders.ProductID
GROUP BY
  Products.ProductName;

-- 2. インデックスを使用してクエリを最適化
-- `ProductID` にインデックスを作成することで`JOIN` 処理が効率化されます。
CREATE INDEX idx_product_id ON Orders (ProductID);

-- 3. インデックスを活用した最適化クエリ
SELECT
  Products.ProductName,
  SUM(Orders.Quantity) AS TotalSales
FROM
  Products
  JOIN Orders ON Products.ProductID = Orders.ProductID
GROUP BY
  Products.ProductName;

-- 4. クエリの見直し：サブクエリの使用
SELECT
  ProductName,
  TotalSales
FROM
  Products
  JOIN (
    SELECT
      ProductID,
      SUM(Quantity) AS TotalSales
    FROM
      Orders
    GROUP BY
      ProductID
  ) AS SalesData ON Products.ProductID = SalesData.ProductID;

-- 5. EXPLAINを使ったクエリの解析
EXPLAIN
SELECT
  Products.ProductName,
  SUM(Orders.Quantity) AS TotalSales
FROM
  Products
  JOIN Orders ON Products.ProductID = Orders.ProductID
GROUP BY
  Products.ProductName;
