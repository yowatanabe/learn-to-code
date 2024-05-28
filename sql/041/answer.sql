-- Q1
SELECT
  CONCAT (FirstName, ' ', LastName) AS FullName
FROM
  Employees;

-- Q2
SELECT
  AVG(Salary) AS AverageSalary,
  MAX(Salary) AS MaxSalary,
  MIN(Salary) AS MinSalary
FROM
  Employees;

-- Q3
SELECT
  FirstName,
  LastName,
  DATEDIFF (CURRENT_DATE, HireDate) AS DaysSinceHire
FROM
  Employees;
