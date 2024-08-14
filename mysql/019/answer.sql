-- データベースの作成
CREATE DATABASE CompanyDB;

-- データベースの選択
USE CompanyDB;

-- Employeesテーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Status ENUM ('Full-Time', 'Part-Time', 'Contract') NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Employees (EmployeeName, HireDate, Salary, Status)
VALUES
  ('Alice', '2022-04-15', 70000.00, 'Full-Time'),
  ('Bob', '2023-06-01', 50000.00, 'Part-Time'),
  ('Charlie', '2024-01-10', 65000.00, 'Contract');
