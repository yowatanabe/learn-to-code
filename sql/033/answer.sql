-- Q1
SELECT
  ProductName,
  Price
FROM
  Products
WHERE
  Price >= (
    SELECT
      AVG(Price)
    FROM
      Products AS p2
    WHERE
      p2.CategoryID = Products.CategoryID
  );

-- Q2
SELECT
  p.ProductName,
  p.Price,
  c.CategoryName
FROM
  Products p
  JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE
  p.Price >= (
    SELECT
      AVG(Price)
    FROM
      Products AS p2
    WHERE
      p2.CategoryID = p.CategoryID
  );
