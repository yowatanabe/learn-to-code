-- 1. 各テーブルの総売上 (`SUM`)
SELECT
  Tables.TableName,
  SUM(OrderItems.Quantity * OrderItems.Price) AS TotalSales
FROM
  Tables
  JOIN Orders ON Tables.TableID = Orders.TableID
  JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY
  Tables.TableName;

-- 2. 各テーブルの平均売上 (`AVG`)
SELECT
  Tables.TableName,
  AVG(OrderItems.Quantity * OrderItems.Price) AS AverageSales
FROM
  Tables
  JOIN Orders ON Tables.TableID = Orders.TableID
  JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY
  Tables.TableName;

-- 3. 各テーブルの注文数 (`COUNT`)
SELECT
  Tables.TableName,
  COUNT(Orders.OrderID) AS OrderCount
FROM
  Tables
  JOIN Orders ON Tables.TableID = Orders.TableID
GROUP BY
  Tables.TableName;

-- 4. 各テーブルの最大売上 (`MAX`)
SELECT
  Tables.TableName,
  MAX(OrderItems.Quantity * OrderItems.Price) AS MaxSale
FROM
  Tables
  JOIN Orders ON Tables.TableID = Orders.TableID
  JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY
  Tables.TableName;

-- 5. 各テーブルの最小売上 (`MIN`)
SELECT
  Tables.TableName,
  MIN(OrderItems.Quantity * OrderItems.Price) AS MinSale
FROM
  Tables
  JOIN Orders ON Tables.TableID = Orders.TableID
  JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY
  Tables.TableName;
