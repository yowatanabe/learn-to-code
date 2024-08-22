-- ORDER BY を使用して、従業員の名前でアルファベット順に並べ替えたクエリ
SELECT
  *
FROM
  EmployeeHours
ORDER BY
  EmployeeName ASC;

-- GROUP BY を使用して従業員ごとの総労働時間を計算するクエリ
SELECT
  EmployeeName,
  SUM(HoursWorked) AS TotalHours
FROM
  EmployeeHours
GROUP BY
  EmployeeName;

-- GROUP BY と ORDER BY を組み合わせて、各部門ごとの総労働時間を計算し、労働時間が多い順に並べ替えたクエリ
SELECT
  Department,
  SUM(HoursWorked) AS TotalHours
FROM
  EmployeeHours
GROUP BY
  Department
ORDER BY
  TotalHours DESC;
