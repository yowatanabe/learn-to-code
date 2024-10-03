-- `INNER JOIN`
SELECT
  Employees.EmployeeName,
  Departments.DepartmentName
FROM
  Employees
  INNER JOIN Departments ON Employees.EmployeeID = Departments.EmployeeID;

-- `LEFT JOIN`
SELECT
  Employees.EmployeeName,
  Departments.DepartmentName
FROM
  Employees
  LEFT JOIN Departments ON Employees.EmployeeID = Departments.EmployeeID;

-- `RIGHT JOIN`
SELECT
  Employees.EmployeeName,
  Departments.DepartmentName
FROM
  Employees
  RIGHT JOIN Departments ON Employees.EmployeeID = Departments.EmployeeID;

-- `FULL OUTER JOIN`
SELECT
  Employees.EmployeeName,
  Departments.DepartmentName
FROM
  Employees
  LEFT JOIN Departments ON Employees.EmployeeID = Departments.EmployeeID
UNION
SELECT
  Employees.EmployeeName,
  Departments.DepartmentName
FROM
  Employees
  RIGHT JOIN Departments ON Employees.EmployeeID = Departments.EmployeeID;
