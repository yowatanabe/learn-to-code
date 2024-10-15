-- 1. カテゴリーごとの総売上を計算するクエリ
SELECT
  Products.Category,
  SUM(Sales.Quantity * Products.Price) AS TotalSales
FROM
  Products
  JOIN Sales ON Products.ProductID = Sales.ProductID
GROUP BY
  Products.Category;

-- 2. 販売日ごとの総売上を計算するクエリ
SELECT
  Sales.SaleDate,
  SUM(Sales.Quantity * Products.Price) AS TotalSales
FROM
  Sales
  JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY
  Sales.SaleDate;

-- 3. カテゴリーごとの売上件数をカウントするクエリ
SELECT
  Products.Category,
  COUNT(Sales.SaleID) AS SalesCount
FROM
  Products
  JOIN Sales ON Products.ProductID = Sales.ProductID
GROUP BY
  Products.Category;
