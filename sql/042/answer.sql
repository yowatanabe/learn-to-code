-- Q1
SELECT
  UPPER(ProductName) AS ProductNameUpperCase
FROM
  Sales;

-- Q2
SELECT
  ProductName,
  Quantity * UnitPrice AS TotalSales
FROM
  Sales;

-- Q3
SELECT
  ProductName,
  YEAR (SaleDate) AS SaleYear,
  MONTH (SaleDate) AS SaleMonth,
  DAY (SaleDate) AS SaleDay
FROM
  Sales;
