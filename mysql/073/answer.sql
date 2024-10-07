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

-- 2. 完了したタスクを持つプロジェクトとその従業員を表示するクエリ
SELECT
  Employees.EmployeeName,
  Projects.ProjectName,
  Tasks.TaskName,
  TaskStatus.LastUpdated
FROM
  Employees
  JOIN Tasks ON Employees.EmployeeID = Tasks.AssignedTo
  JOIN Projects ON Tasks.ProjectID = Projects.ProjectID
  JOIN TaskStatus ON Tasks.TaskID = TaskStatus.TaskID
WHERE
  TaskStatus.Status = 'Completed';
