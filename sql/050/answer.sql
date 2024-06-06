-- Q1
SELECT
  UserName,
  ContactNumber
FROM
  Users
WHERE
  ContactNumber LIKE '123%';

-- Q2
SELECT
  UserName,
  ContactNumber
FROM
  Users
WHERE
  ContactNumber REGEXP '555';
