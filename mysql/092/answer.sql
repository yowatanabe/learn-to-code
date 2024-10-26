-- パフォーマンスが低いクエリの例
SELECT
  Customers.CustomerName,
  SUM(Orders.Quantity) AS TotalQuantity
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
  Customers.CustomerName;

-- `EXPLAIN` を使用したクエリの解析
EXPLAIN
SELECT
  Customers.CustomerName,
  SUM(Orders.Quantity) AS TotalQuantity
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
  Customers.CustomerName;

-- インデックスを使用した最適化
CREATE INDEX idx_customer_id ON Orders (CustomerID);

-- インデックスを使った最適化クエリ
SELECT
  Customers.CustomerName,
  SUM(Orders.Quantity) AS TotalQuantity
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
  Customers.CustomerName;

-- `EXPLAIN ANALYZE` を使用したクエリの実行分析
EXPLAIN ANALYZE
SELECT
  Customers.CustomerName,
  SUM(Orders.Quantity) AS TotalQuantity
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
  Customers.CustomerName\G
