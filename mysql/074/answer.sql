-- 1. 従業員ごとのプロジェクトとタスクの進捗を表示するクエリ
SELECT
  Employees.EmployeeName,
  Projects.ProjectName,
  Tasks.TaskName,
  TaskStatus.Status,
  TaskStatus.LastUpdated
FROM
  Employees
  JOIN Tasks ON Employees.EmployeeID = Tasks.AssignedTo
  JOIN Projects ON Tasks.ProjectID = Projects.ProjectID
  JOIN TaskStatus ON Tasks.TaskID = TaskStatus.TaskID
ORDER BY
  Employees.EmployeeName,
  Projects.ProjectName;

-- 2. 進行中のタスクを持つプロジェクトとその担当者を表示するクエリ
SELECT
  Employees.EmployeeName,
  Projects.ProjectName,
  Tasks.TaskName,
  TaskStatus.Status
FROM
  Employees
  JOIN Tasks ON Employees.EmployeeID = Tasks.AssignedTo
  JOIN Projects ON Tasks.ProjectID = Projects.ProjectID
  JOIN TaskStatus ON Tasks.TaskID = TaskStatus.TaskID
WHERE
  TaskStatus.Status = 'In Progress';
