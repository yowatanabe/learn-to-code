-- EmployeesテーブルのHireDate列にインデックスを作成
CREATE INDEX idx_hire_date ON Employees (HireDate);

-- EmployeesテーブルのDepartmentID列にインデックスを作成
CREATE INDEX idx_department_id ON Employees (DepartmentID);

-- クエリを変更
SELECT
  d.DepartmentName,
  e.EmployeeName,
  e.HireDate,
  e.Salary
FROM
  Departments d
  JOIN (
    SELECT
      EmployeeID,
      EmployeeName,
      DepartmentID,
      HireDate,
      Salary
    FROM
      Employees
    WHERE
      HireDate BETWEEN '2019-01-01' AND '2021-12-31'
  ) e ON e.DepartmentID = d.DepartmentID
ORDER BY
  e.Salary DESC;
