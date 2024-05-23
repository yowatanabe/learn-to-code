-- Q1
SELECT
  CustomerName
FROM
  Customers c
WHERE
  EXISTS (
    SELECT
      1
    FROM
      Orders o
    WHERE
      o.CustomerID = c.CustomerID
  );

-- Q2
SELECT
  CustomerName
FROM
  Customers
WHERE
  City IN ('New York', 'Chicago');

-- Q3
SELECT
  CustomerName
FROM
  Customers c
WHERE
  CustomerID IN (
    SELECT
      CustomerID
    FROM
      Orders
    WHERE
      OrderAmount > ANY (
        SELECT
          MAX(OrderAmount)
        FROM
          Orders
        WHERE
          CustomerID = 1
      )
  );

-- Q4
SELECT
  CustomerName
FROM
  Customers c
WHERE
  CustomerID IN (
    SELECT
      CustomerID
    FROM
      Orders
    WHERE
      OrderAmount > ALL (
        SELECT
          OrderAmount
        FROM
          Orders
      )
  );
