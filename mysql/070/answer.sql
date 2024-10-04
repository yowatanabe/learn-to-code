-- `INNER JOIN`
SELECT
  Books.BookTitle,
  Authors.AuthorName
FROM
  Books
  INNER JOIN Authors ON Books.BookID = Authors.BookID;

-- `LEFT JOIN`
SELECT
  Books.BookTitle,
  Authors.AuthorName
FROM
  Books
  LEFT JOIN Authors ON Books.BookID = Authors.BookID;

-- `RIGHT JOIN`
SELECT
  Books.BookTitle,
  Authors.AuthorName
FROM
  Books
  RIGHT JOIN Authors ON Books.BookID = Authors.BookID;

-- `FULL OUTER JOIN`
SELECT
  Books.BookTitle,
  Authors.AuthorName
FROM
  Books
  LEFT JOIN Authors ON Books.BookID = Authors.BookID
UNION
SELECT
  Books.BookTitle,
  Authors.AuthorName
FROM
  Books
  RIGHT JOIN Authors ON Books.BookID = Authors.BookID;
