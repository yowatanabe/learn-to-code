-- Q1
SELECT
  c.CustomerName,
  (
    SELECT
      SUM(o.Amount)
    FROM
      Orders o
    WHERE
      o.CustomerID = c.CustomerID
  ) AS TotalAmount
FROM
  Customers c
WHERE
  (
    SELECT
      AVG(o.Amount)
    FROM
      Orders o
    WHERE
      o.CustomerID = c.CustomerID
  ) > (
    SELECT
      AVG(TotalAmount)
    FROM
      (
        SELECT
          AVG(Amount) AS TotalAmount
        FROM
          Orders
        GROUP BY
          CustomerID
      ) AS subquery
  );

-- Q2
SELECT
  c.CustomerName,
  (
    SELECT
      SUM(o.Amount)
    FROM
      Orders o
    WHERE
      o.CustomerID = c.CustomerID
  ) AS TotalAmount,
  (
    SELECT
      COUNT(*)
    FROM
      Orders o
    WHERE
      o.CustomerID = c.CustomerID
  ) AS OrderCount
FROM
  Customers c
WHERE
  (
    SELECT
      AVG(o.Amount)
    FROM
      Orders o
    WHERE
      o.CustomerID = c.CustomerID
  ) > (
    SELECT
      AVG(TotalAmount)
    FROM
      (
        SELECT
          AVG(Amount) AS TotalAmount
        FROM
          Orders
        GROUP BY
          CustomerID
      ) AS subquery
  );
