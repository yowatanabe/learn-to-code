-- データベースの作成
CREATE DATABASE CompanyDB;

-- データベースの選択
USE CompanyDB;

-- Employeesテーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    HireDate DATE NOT NULL,
    Status VARCHAR(50) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Employees (
    EmployeeName,
    Department,
    Salary,
    HireDate,
    Status
  )
VALUES
  ('Alice', 'HR', 60000, '2020-05-10', 'Active'),
  ('Bob', 'IT', 75000, '2019-03-15', 'Active'),
  (
    'Charlie',
    'Finance',
    70000,
    '2021-07-22',
    'On Leave'
  ),
  ('David', 'IT', 80000, '2018-11-05', 'Active'),
  ('Eve', 'HR', 65000, '2022-01-10', 'Resigned');
