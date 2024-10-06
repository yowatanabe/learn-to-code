-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100)
  );

CREATE TABLE
  Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100)
  );

CREATE TABLE
  Tasks (
    TaskID INT PRIMARY KEY,
    ProjectID INT,
    TaskName VARCHAR(100),
    AssignedTo INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID),
    FOREIGN KEY (AssignedTo) REFERENCES Employees (EmployeeID)
  );

CREATE TABLE
  TaskStatus (
    TaskID INT PRIMARY KEY,
    Status VARCHAR(50),
    CompletionDate DATE,
    FOREIGN KEY (TaskID) REFERENCES Tasks (TaskID)
  );

-- 初期データ挿
INSERT INTO
  Employees (EmployeeID, EmployeeName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Projects (ProjectID, ProjectName)
VALUES
  (101, 'Website Redesign'),
  (102, 'App Development'),
  (103, 'Database Upgrade');

INSERT INTO
  Tasks (TaskID, ProjectID, TaskName, AssignedTo)
VALUES
  (1001, 101, 'Frontend Design', 1),
  (1002, 101, 'Backend Setup', 2),
  (1003, 102, 'API Development', 3),
  (1004, 103, 'DB Schema Design', 2),
  (1005, 103, 'Performance Test', 1);

INSERT INTO
  TaskStatus (TaskID, Status, CompletionDate)
VALUES
  (1001, 'Completed', '2024-10-01'),
  (1002, 'In Progress', NULL),
  (1003, 'Completed', '2024-10-10'),
  (1004, 'In Progress', NULL),
  (1005, 'Not Started', NULL);
