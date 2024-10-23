-- 非効率なクエリの例
SELECT
  Products.ProductName,
  SUM(Orders.Quantity) AS TotalSold,
  SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM
  Products
  JOIN Orders ON Products.ProductID = Orders.ProductID
GROUP BY
  Products.ProductName;

-- `EXPLAIN` を使ったクエリの解析
EXPLAIN
SELECT
  Products.ProductName,
  SUM(Orders.Quantity) AS TotalSold,
  SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM
  Products
  JOIN Orders ON Products.ProductID = Orders.ProductID
GROUP BY
  Products.ProductName;

-- インデックスを使用した最適化
CREATE INDEX idx_product_id ON Orders (ProductID);

-- インデックスを活用した最適化クエリ
SELECT
  Products.ProductName,
  SUM(Orders.Quantity) AS TotalSold,
  SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM
  Products
  JOIN Orders ON Products.ProductID = Orders.ProductID
GROUP BY
  Products.ProductName;

-- サブクエリの使用による最適化
SELECT
  Products.ProductName,
  SalesData.TotalSold,
  SalesData.TotalRevenue
FROM
  Products
  JOIN (
    SELECT
      Orders.ProductID,
      SUM(Orders.Quantity) AS TotalSold,
      SUM(Orders.Quantity * Products.Price) AS TotalRevenue
    FROM
      Orders
      JOIN Products ON Orders.ProductID = Products.ProductID
    GROUP BY
      Orders.ProductID
  ) AS SalesData ON Products.ProductID = SalesData.ProductID;

-- `EXPLAIN` を使ったクエリの解析
EXPLAIN
SELECT
  Products.ProductName,
  SUM(Orders.Quantity) AS TotalSold,
  SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM
  Products
  JOIN Orders ON Products.ProductID = Orders.ProductID
GROUP BY
  Products.ProductName;
