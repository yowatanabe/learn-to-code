-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
  );

-- 初期データの挿入
INSERT INTO
  Employees (EmployeeID, EmployeeName, Department, Salary)
VALUES
  (1, 'Alice', 'Development', 70000),
  (2, 'Bob', 'HR', 50000),
  (3, 'Charlie', 'Development', 75000),
  (4, 'David', 'Marketing', 60000),
  (5, 'Eve', 'HR', 55000);
