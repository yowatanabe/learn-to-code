-- Q1
SELECT
  ProductName,
  TotalSales
FROM
  Products
  JOIN (
    SELECT
      ProductID,
      SUM(Quantity * Price) AS TotalSales
    FROM
      Sales
    GROUP BY
      ProductID
  ) AS subquery ON Products.ProductID = subquery.ProductID
ORDER BY
  TotalSales DESC
LIMIT
  1;

-- Q2
SELECT
  p.ProductName,
  sub.TotalSales,
  sub.TotalQuantity
FROM
  Products p
  JOIN (
    SELECT
      ProductID,
      SUM(Quantity * Price) AS TotalSales,
      SUM(Quantity) AS TotalQuantity
    FROM
      Sales
    GROUP BY
      ProductID
  ) AS sub ON p.ProductID = sub.ProductID
ORDER BY
  sub.TotalSales DESC
LIMIT
  1;
