-- **プロジェクトに割り当てられた社員とその役割を取得するクエリ
SELECT
  Employees.EmployeeName,
  Projects.ProjectName,
  Assignments.Role
FROM
  Assignments
  JOIN Employees ON Assignments.EmployeeID = Employees.EmployeeID
  JOIN Projects ON Assignments.ProjectID = Projects.ProjectID;
