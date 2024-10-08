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
    LastUpdated DATE,
    FOREIGN KEY (TaskID) REFERENCES Tasks (TaskID)
  );

-- 初期データ挿入
INSERT INTO
  Employees (EmployeeID, EmployeeName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Projects (ProjectID, ProjectName)
VALUES
  (101, 'Cloud Migration'),
  (102, 'Website Redesign'),
  (103, 'AI Development');

INSERT INTO
  Tasks (TaskID, ProjectID, TaskName, AssignedTo)
VALUES
  (1001, 101, 'Set up VM', 1),
  (1002, 101, 'Data Migration', 2),
  (1003, 102, 'UI Design', 3),
  (1004, 102, 'Backend Dev', 1),
  (1005, 103, 'Model Training', 2);

INSERT INTO
  TaskStatus (TaskID, Status, LastUpdated)
VALUES
  (1001, 'Completed', '2024-10-01'),
  (1002, 'In Progress', '2024-10-02'),
  (1003, 'In Progress', '2024-10-03'),
  (1004, 'Not Started', NULL),
  (1005, 'Completed', '2024-10-05');
