-- データベースの作成
CREATE DATABASE ProjectManagementDB;

-- データベースの選択
USE ProjectManagementDB;

-- Projectsテーブルの作成
CREATE TABLE
  Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE
  );

-- Employeesテーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    Department VARCHAR(100) NOT NULL
  );

-- Assignmentsテーブルの作成
CREATE TABLE
  Assignments (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectID INT,
    EmployeeID INT,
    Role VARCHAR(100),
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
  );

-- Projectsテーブルへのデータ挿入
INSERT INTO
  Projects (ProjectName, StartDate, EndDate)
VALUES
  ('Project Alpha', '2024-01-01', '2024-04-30'),
  ('Project Beta', '2024-02-01', '2024-05-31'),
  ('Project Gamma', '2024-03-01', NULL);

-- Employeesテーブルへのデータ挿入
INSERT INTO
  Employees (EmployeeName, Department)
VALUES
  ('Alice', 'Engineering'),
  ('Bob', 'Marketing'),
  ('Charlie', 'Finance'),
  ('David', 'Engineering'),
  ('Eve', 'HR');

-- Assignmentsテーブルへのデータ挿入
INSERT INTO
  Assignments (ProjectID, EmployeeID, Role)
VALUES
  (1, 1, 'Developer'),
  (1, 2, 'Marketing Specialist'),
  (2, 3, 'Financial Analyst'),
  (2, 4, 'Developer'),
  (3, 5, 'HR Specialist');
