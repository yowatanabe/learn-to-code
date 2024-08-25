-- ORDER BY を使用して、給与支払い日で降順に並べ替えたクエリ
SELECT
  *
FROM
  EmployeeSalaries
ORDER BY
  PaymentDate DESC;

-- GROUP BY を使用して各部門ごとの平均給与を計算するクエリ
SELECT
  Department,
  AVG(Salary) AS AverageSalary
FROM
  EmployeeSalaries
GROUP BY
  Department;

-- GROUP BY と ORDER BY を組み合わせて、各部門ごとの平均給与を計算し、給与が高い順に並べ替えたクエリ
SELECT
  Department,
  AVG(Salary) AS AverageSalary
FROM
  EmployeeSalaries
GROUP BY
  Department
ORDER BY
  AverageSalary DESC;
