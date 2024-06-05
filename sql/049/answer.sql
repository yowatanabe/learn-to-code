-- Q1
SELECT
  EmployeeName,
  Email
FROM
  Employees
WHERE
  Email LIKE '%@company.com';

-- Q2
SELECT
  EmployeeName,
  Email
FROM
  Employees
WHERE
  EmployeeName REGEXP '^A';
