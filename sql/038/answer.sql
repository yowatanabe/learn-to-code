-- Q1
SELECT
  AuthorName
FROM
  Authors a
WHERE
  EXISTS (
    SELECT
      1
    FROM
      Books b
    WHERE
      b.AuthorID = a.AuthorID
      AND b.Price >= 20
  );

-- Q2
SELECT
  Title
FROM
  Books
WHERE
  AuthorID IN (
    SELECT
      AuthorID
    FROM
      Authors
    WHERE
      AuthorName IN ('George Orwell', 'Harper Lee')
  );

-- Q3
SELECT
  Title
FROM
  Books
WHERE
  Price > ANY (
    SELECT
      Price
    FROM
      Books
    WHERE
      AuthorID = (
        SELECT
          AuthorID
        FROM
          Authors
        WHERE
          AuthorName = 'George Orwell'
      )
  );

-- Q4
SELECT
  Title
FROM
  Books
WHERE
  Price > ALL (
    SELECT
      Price
    FROM
      Books
    WHERE
      AuthorID = (
        SELECT
          AuthorID
        FROM
          Authors
        WHERE
          AuthorName = 'George Orwell'
      )
  );
