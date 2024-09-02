-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
-- Employeesテーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NOT NULL
  );

-- Projectsテーブルの作成
CREATE TABLE
  Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL
  );

-- Assignmentsテーブルの作成
CREATE TABLE
  Assignments (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(100),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects (ProjectID)
  );

-- 初期データの挿入
-- Employeesテーブルにデータを挿入
INSERT INTO
  Employees (EmployeeID, EmployeeName, Department)
VALUES
  (1, 'Alice', 'Development'),
  (2, 'Bob', 'IT Support'),
  (3, 'Charlie', 'Quality Assurance');

-- Projectsテーブルにデータを挿入
INSERT INTO
  Projects (ProjectID, ProjectName, StartDate)
VALUES
  (101, 'Website Redesign', '2024-09-01'),
  (102, 'Mobile App Development', '2024-09-10'),
  (103, 'Network Upgrade', '2024-09-15');

-- Assignmentsテーブルにデータを挿入
INSERT INTO
  Assignments (EmployeeID, ProjectID, Role)
VALUES
  (1, 101, 'Frontend Developer'),
  (2, 103, 'Network Engineer'),
  (3, 102, 'QA Specialist'),
  (1, 102, 'Backend Developer');
