-- 1. INNER JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  Employees.EmployeeID,
  Employees.Name,
  Departments.DepartmentName
FROM
  Employees
  INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- 2. LEFT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  Employees.EmployeeID,
  Employees.Name,
  Departments.DepartmentName
FROM
  Employees
  LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

-- 3. RIGHT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  Employees.EmployeeID,
  Employees.Name,
  Departments.DepartmentName
FROM
  Employees
  RIGHT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
