-- データベースの作成
CREATE DATABASE CompanyDB;

-- データベースの選択
USE CompanyDB;

-- Employeesテーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Department VARCHAR(50) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Employees (EmployeeName, BirthDate, Salary, Department)
VALUES
  ('Alice', '1990-01-15', 60000.00, 'HR'),
  ('Bob', '1985-03-22', 70000.00, 'IT'),
  ('Charlie', '1992-07-30', 55000.00, 'Finance');

-- データの挿入
INSERT INTO
  Employees (EmployeeName, BirthDate, Salary, Department)
VALUES
  ('David', '1988-05-12', 65000.00, 'HR');

-- データの更新
UPDATE Employees
SET
  Salary = 75000.00
WHERE
  EmployeeName = 'Bob';

-- データの削除
DELETE FROM Employees
WHERE
  EmployeeName = 'Charlie';
