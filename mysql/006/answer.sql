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
    Salary DECIMAL(10, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Employees (EmployeeName, Department, Salary)
VALUES
  ('Alice', 'Engineering', 60000),
  ('Bob', 'Marketing', 50000),
  ('Charlie', 'Finance', 55000);
