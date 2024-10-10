-- 1. 各製品の総売上数量 (`SUM`)
SELECT
  Products.ProductName,
  SUM(Sales.Quantity) AS TotalQuantitySold
FROM
  Products
  JOIN Sales ON Products.ProductID = Sales.ProductID
GROUP BY
  Products.ProductName;

-- 2. 各製品の平均売上数量 (`AVG`)
SELECT
  Products.ProductName,
  AVG(Sales.Quantity) AS AverageQuantitySold
FROM
  Products
  JOIN Sales ON Products.ProductID = Sales.ProductID
GROUP BY
  Products.ProductName;

-- 3. 売上記録の総件数 (`COUNT`)
SELECT
  COUNT(*) AS TotalSales
FROM
  Sales;

-- 4. 最大売上数量 (`MAX`)
SELECT
  MAX(Sales.Quantity) AS MaxQuantitySold
FROM
  Sales;

-- 5. 最小売上数量 (`MIN`)
SELECT
  MIN(Sales.Quantity) AS MinQuantitySold
FROM
  Sales;
