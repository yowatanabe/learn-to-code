-- Q1
SELECT
  CustomerName,
  Email
FROM
  Customers
WHERE
  Email LIKE '%example.com';

-- Q2
SELECT
  CustomerName,
  Email
FROM
  Customers
WHERE
  Email REGEXP '[0-9]';
