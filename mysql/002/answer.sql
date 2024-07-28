-- データベースの作成
CREATE DATABASE CompanyDB;

-- データベースの選択
USE CompanyDB;

-- Departmentsテーブルの作成
CREATE TABLE
  Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL
  );

-- Employeesテーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID)
  );

-- Salariesテーブルの作成
CREATE TABLE
  Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    SalaryAmount DECIMAL(10, 2),
    SalaryDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
  );

-- Departmentsテーブルへのデータ挿入
INSERT INTO
  Departments (DepartmentName)
VALUES
  ('HR'),
  ('IT'),
  ('Finance');

-- Employeesテーブルへのデータ挿入
INSERT INTO
  Employees (EmployeeName, DepartmentID, HireDate)
VALUES
  ('Alice', 1, '2020-01-15'),
  ('Bob', 2, '2019-03-20'),
  ('Charlie', 1, '2021-06-10'),
  ('David', 3, '2018-11-25'),
  ('Eve', 2, '2020-09-30');

-- Salariesテーブルへのデータ挿入
INSERT INTO
  Salaries (EmployeeID, SalaryAmount, SalaryDate)
VALUES
  (1, 60000, '2023-01-01'),
  (2, 70000, '2023-01-01'),
  (3, 55000, '2023-01-01'),
  (4, 80000, '2023-01-01'),
  (5, 75000, '2023-01-01');
