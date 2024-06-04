-- Q1
SELECT
  Title,
  Author
FROM
  Books
WHERE
  Title LIKE '%Great%';

-- Q2
SELECT
  Title,
  Author
FROM
  Books
WHERE
  Author REGEXP '\\bG';
