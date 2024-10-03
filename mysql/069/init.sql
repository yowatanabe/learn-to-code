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
  Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
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
  Departments (DepartmentID, DepartmentName, EmployeeID)
VALUES
  (1, 'HR', 1),
  (2, 'IT', 2),
  (3, 'Finance', NULL);
