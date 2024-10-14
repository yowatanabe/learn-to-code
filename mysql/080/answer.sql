-- 1. 各書籍の総売上 (`SUM`)
SELECT
  Books.BookTitle,
  SUM(Sales.Quantity * Books.Price) AS TotalSales
FROM
  Books
  JOIN Sales ON Books.BookID = Sales.BookID
GROUP BY
  Books.BookTitle;

-- 2. 各書籍の平均販売数量 (`AVG`)
SELECT
  Books.BookTitle,
  AVG(Sales.Quantity) AS AverageQuantitySold
FROM
  Books
  JOIN Sales ON Books.BookID = Sales.BookID
GROUP BY
  Books.BookTitle;

-- 3. 総販売件数 (`COUNT`)
SELECT
  COUNT(*) AS TotalSalesCount
FROM
  Sales;

-- 4. 最大販売数量 (`MAX`)
SELECT
  MAX(Sales.Quantity) AS MaxQuantitySold
FROM
  Sales;

-- 5. 最小販売数量 (`MIN`)
SELECT
  MIN(Sales.Quantity) AS MinQuantitySold
FROM
  Sales;
