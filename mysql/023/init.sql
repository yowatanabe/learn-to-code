-- データベースの作成
CREATE DATABASE CompanyProjectsDB;

-- データベースの選択
USE CompanyProjectsDB;

-- Projectsテーブルの作成
CREATE TABLE
  Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Budget DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Projects (ProjectName, StartDate, EndDate, Budget, Status)
VALUES
  (
    'Website Redesign',
    '2024-01-01',
    '2024-06-01',
    50000,
    'Completed'
  ),
  (
    'Marketing Campaign',
    '2024-02-15',
    '2024-08-30',
    30000,
    'Ongoing'
  ),
  (
    'Product Launch',
    '2024-03-01',
    NULL,
    150000,
    'Planned'
  ),
  (
    'Office Relocation',
    '2024-04-01',
    '2024-07-15',
    75000,
    'Completed'
  ),
  (
    'New HR System',
    '2024-05-01',
    '2024-12-31',
    100000,
    'Ongoing'
  );
