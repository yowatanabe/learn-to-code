-- 1. プロジェクトごとの合計作業時間 (`SUM`)
SELECT
  Projects.ProjectName,
  SUM(WorkLog.HoursWorked) AS TotalHoursWorked
FROM
  Projects
  JOIN WorkLog ON Projects.ProjectID = WorkLog.ProjectID
GROUP BY
  Projects.ProjectName;

-- 2. 従業員ごとの平均作業時間 (`AVG`)
SELECT
  Employees.EmployeeName,
  AVG(WorkLog.HoursWorked) AS AverageHoursPerDay
FROM
  Employees
  JOIN WorkLog ON Employees.EmployeeID = WorkLog.EmployeeID
GROUP BY
  Employees.EmployeeName;

-- 3. プロジェクトごとの作業記録の件数 (`COUNT`)
SELECT
  Projects.ProjectName,
  COUNT(WorkLog.WorkLogID) AS WorkLogCount
FROM
  Projects
  JOIN WorkLog ON Projects.ProjectID = WorkLog.ProjectID
GROUP BY
  Projects.ProjectName;
