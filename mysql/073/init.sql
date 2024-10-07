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
  (3, 'Charlie'),
  (4, 'David');

INSERT INTO
  Projects (ProjectID, ProjectName)
VALUES
  (101, 'Cloud Migration'),
  (102, 'Web Redesign'),
  (103, 'AI Development');

INSERT INTO
  Tasks (TaskID, ProjectID, TaskName, AssignedTo)
VALUES
  (1001, 101, 'VM Setup', 1),
  (1002, 101, 'Data Transfer', 2),
  (1003, 102, 'Frontend Design', 1),
  (1004, 103, 'Model Training', 3),
  (1005, 102, 'Backend Integration', 4);

INSERT INTO
  TaskStatus (TaskID, Status, LastUpdated)
VALUES
  (1001, 'In Progress', '2024-10-01'),
  (1002, 'Completed', '2024-09-28'),
  (1003, 'In Progress', '2024-10-02'),
  (1004, 'Completed', '2024-09-30'),
  (1005, 'Not Started', NULL);
