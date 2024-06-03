-- Q1
SELECT
  ProductName,
  Category
FROM
  Products
WHERE
  ProductName LIKE '%13%';

-- Q2
SELECT
  ProductName,
  Category
FROM
  Products
WHERE
  Category REGEXP '^Electronics';
