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
  WorkLog (
    WorkLogID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    HoursWorked DECIMAL(5, 2),
    WorkDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID)
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
  (101, 'Website Redesign'),
  (102, 'Mobile App Development'),
  (103, 'Backend Migration');

INSERT INTO
  WorkLog (
    WorkLogID,
    EmployeeID,
    ProjectID,
    HoursWorked,
    WorkDate
  )
VALUES
  (1, 1, 101, 5, '2024-10-01'),
  (2, 2, 101, 6, '2024-10-02'),
  (3, 3, 102, 4, '2024-10-02'),
  (4, 1, 103, 3, '2024-10-03'),
  (5, 2, 102, 7, '2024-10-03'),
  (6, 3, 103, 8, '2024-10-04');
