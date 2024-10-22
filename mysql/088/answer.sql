-- 非効率なクエリの例
SELECT
  Customers.CustomerName,
  COUNT(Orders.OrderID) AS OrderCount,
  SUM(Orders.TotalAmount) AS TotalSpent
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
  Customers.CustomerName;

-- クエリ実行計画の確認
EXPLAIN
SELECT
  Customers.CustomerName,
  COUNT(Orders.OrderID) AS OrderCount,
  SUM(Orders.TotalAmount) AS TotalSpent
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
  Customers.CustomerName;

-- インデックスを使用した最適化
CREATE INDEX idx_customer_id ON Orders (CustomerID);

-- インデックスを使用した最適化クエリ
SELECT
  Customers.CustomerName,
  COUNT(Orders.OrderID) AS OrderCount,
  SUM(Orders.TotalAmount) AS TotalSpent
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
  Customers.CustomerName;

-- サブクエリによる最適化
SELECT
  CustomerName,
  OrderData.OrderCount,
  OrderData.TotalSpent
FROM
  Customers
  JOIN (
    SELECT
      CustomerID,
      COUNT(OrderID) AS OrderCount,
      SUM(TotalAmount) AS TotalSpent
    FROM
      Orders
    GROUP BY
      CustomerID
  ) AS OrderData ON Customers.CustomerID = OrderData.CustomerID;

-- クエリ実行計画の確認
EXPLAIN
SELECT
  Customers.CustomerName,
  COUNT(Orders.OrderID) AS OrderCount,
  SUM(Orders.TotalAmount) AS TotalSpent
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
  Customers.CustomerName;
