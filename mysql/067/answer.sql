-- `INNER JOIN`
SELECT
  Employees.EmployeeName,
  Projects.ProjectName
FROM
  Employees
  INNER JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID;

-- `LEFT JOIN`
SELECT
  Employees.EmployeeName,
  Projects.ProjectName
FROM
  Employees
  LEFT JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID;

-- `RIGHT JOIN`
SELECT
  Employees.EmployeeName,
  Projects.ProjectName
FROM
  Employees
  RIGHT JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID;

-- `FULL OUTER JOIN`
SELECT
  Employees.EmployeeName,
  Projects.ProjectName
FROM
  Employees
  LEFT JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID
UNION
SELECT
  Employees.EmployeeName,
  Projects.ProjectName
FROM
  Employees
  RIGHT JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID;
