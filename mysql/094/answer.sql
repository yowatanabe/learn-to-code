-- パフォーマンスが低いクエリの例
SELECT
  Customers.CustomerName,
  SUM(Purchases.Quantity) AS TotalQuantity
FROM
  Customers
  JOIN Purchases ON Customers.CustomerID = Purchases.CustomerID
GROUP BY
  Customers.CustomerName;

-- `EXPLAIN` を使用してクエリの解析
EXPLAIN
SELECT
  Customers.CustomerName,
  SUM(Purchases.Quantity) AS TotalQuantity
FROM
  Customers
  JOIN Purchases ON Customers.CustomerID = Purchases.CustomerID
GROUP BY
  Customers.CustomerName;

-- インデックスを使用した最適化
CREATE INDEX idx_customer_id ON Purchases (CustomerID);

-- インデックスを使用した最適化クエリ
SELECT
  Customers.CustomerName,
  SUM(Purchases.Quantity) AS TotalQuantity
FROM
  Customers
  JOIN Purchases ON Customers.CustomerID = Purchases.CustomerID
GROUP BY
  Customers.CustomerName;

-- `EXPLAIN ANALYZE` を使用したクエリの実行分析
EXPLAIN ANALYZE
SELECT
  Customers.CustomerName,
  SUM(Purchases.Quantity) AS TotalQuantity
FROM
  Customers
  JOIN Purchases ON Customers.CustomerID = Purchases.CustomerID
GROUP BY
  Customers.CustomerName\G
