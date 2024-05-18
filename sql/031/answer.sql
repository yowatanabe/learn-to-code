-- 1. 各部門の平均給与を計算し、それより高い給与を持つ従業員の名前と給与を表示。
SELECT
  Name,
  Salary
FROM
  Employees
WHERE
  Salary > (
    SELECT
      AVG(Salary)
    FROM
      Employees
  )
ORDER BY
  Salary DESC;

-- 2. 上記の結果に部門名も追加。
SELECT
  e.Name,
  e.Salary,
  d.DepartmentName
FROM
  Employees e
  JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE
  e.Salary > (
    SELECT
      AVG(Salary)
    FROM
      Employees
  )
ORDER BY
  Salary DESC;
