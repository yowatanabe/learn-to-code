-- Q1
SELECT
  CONCAT (FirstName, ' ', LastName) AS FullName
FROM
  Employees;

-- Q2
SELECT
  FirstName,
  LastName,
  Salary,
  Salary * 1.10 AS NewSalary
FROM
  Employees;

-- Q3
SELECT
  FirstName,
  LastName,
  HireDate,
  FLOOR(DATEDIFF (CURRENT_DATE, HireDate) / 365) AS YearsSinceHire
FROM
  Employees;
