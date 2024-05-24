-- Q1
SELECT
  DepartmentName
FROM
  Departments d
WHERE
  EXISTS (
    SELECT
      1
    FROM
      Employees e
    WHERE
      e.DepartmentID = d.DepartmentID
      AND e.Salary >= 50000
  );

-- Q2
SELECT
  EmployeeName
FROM
  Employees
WHERE
  DepartmentID IN (
    SELECT
      DepartmentID
    FROM
      Departments
    WHERE
      DepartmentName IN ('HR', 'IT')
  );

-- Q3
SELECT
  EmployeeName
FROM
  Employees
WHERE
  Salary > ANY (
    SELECT
      Salary
    FROM
      Employees
    WHERE
      DepartmentID = 2
  );

-- Q4
SELECT
  EmployeeName
FROM
  Employees
WHERE
  Salary > ALL (
    SELECT
      Salary
    FROM
      Employees
    WHERE
      DepartmentID = 1
  );
