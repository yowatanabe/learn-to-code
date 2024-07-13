-- ビューの作成
CREATE VIEW
  EmployeeDetails AS
SELECT
  e.EmployeeID,
  e.EmployeeName,
  d.DepartmentName,
  e.HireDate,
  e.Salary
FROM
  Employees e
  JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- ビューの使用
SELECT
  EmployeeID,
  EmployeeName,
  DepartmentName,
  HireDate,
  Salary
FROM
  EmployeeDetails
WHERE
  DepartmentName = 'IT';
