-- Q1
SELECT
  LOWER(CustomerName) AS CustomerNameLowerCase
FROM
  Orders;

-- Q2
SELECT
  CustomerName,
  OrderAmount,
  OrderAmount * 0.08 AS TaxAmount
FROM
  Orders;

-- Q3
SELECT
  CustomerName,
  OrderDate,
  DAYNAME (OrderDate) AS OrderDay
FROM
  Orders;
