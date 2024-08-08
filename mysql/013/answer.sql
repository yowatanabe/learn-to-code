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
    HireDate DATE NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Employees (EmployeeName, BirthDate, HireDate, Salary)
VALUES
  ('Alice', '1990-01-15', '2015-06-01', 60000.00),
  ('Bob', '1985-03-22', '2018-09-15', 70000.00),
  ('Charlie', '1992-07-30', '2020-01-10', 55000.00);

-- すべての従業員の名前と生年月日を選択するクエリ
SELECT
  EmployeeName,
  BirthDate
FROM
  Employees;

-- 特定の日付以降に雇用された従業員を選択するクエリ（例: 2017-01-01以降に雇用された従業員）
SELECT
  EmployeeName,
  HireDate
FROM
  Employees
WHERE
  HireDate >= '2017-01-01';

-- 新しい従業員を追加するクエリ
INSERT INTO
  Employees (EmployeeName, BirthDate, HireDate, Salary)
VALUES
  ('David', '1988-05-12', '2021-04-10', 65000.00);

-- 特定の従業員の給与を更新するクエリ（例: Bobの給与を75000.00に更新）
UPDATE Employees
SET
  Salary = 75000.00
WHERE
  EmployeeName = 'Bob';

-- 特定の従業員を削除するクエリ（例: Charlieを削除）
DELETE FROM Employees
WHERE
  EmployeeName = 'Charlie';
