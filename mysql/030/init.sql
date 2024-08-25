-- データベースの作成
CREATE DATABASE CompanyFinancesDB;

-- データベースの選択
USE CompanyFinancesDB;

-- EmployeeSalariesテーブルの作成
CREATE TABLE
  EmployeeSalaries (
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  EmployeeSalaries (
    EmployeeID,
    EmployeeName,
    Department,
    Salary,
    PaymentDate
  )
VALUES
  (1, 'Alice', 'HR', 6000, '2024-07-30'),
  (2, 'Bob', 'IT', 7000, '2024-07-30'),
  (3, 'Charlie', 'Finance', 5500, '2024-07-30'),
  (1, 'Alice', 'HR', 6000, '2024-08-31'),
  (2, 'Bob', 'IT', 7000, '2024-08-31'),
  (3, 'Charlie', 'Finance', 5500, '2024-08-31'),
  (4, 'David', 'IT', 7500, '2024-08-31');
