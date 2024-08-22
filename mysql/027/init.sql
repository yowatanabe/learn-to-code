-- データベースの作成
CREATE DATABASE CompanyDB;

-- データベースの選択
USE CompanyDB;

-- EmployeeHoursテーブルの作成
CREATE TABLE
  EmployeeHours (
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    WorkDate DATE NOT NULL,
    HoursWorked INT NOT NULL,
    Department VARCHAR(100) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  EmployeeHours (
    EmployeeID,
    EmployeeName,
    WorkDate,
    HoursWorked,
    Department
  )
VALUES
  (1, 'Alice', '2024-08-01', 8, 'HR'),
  (2, 'Bob', '2024-08-01', 6, 'IT'),
  (3, 'Charlie', '2024-08-01', 8, 'Finance'),
  (1, 'Alice', '2024-08-02', 7, 'HR'),
  (2, 'Bob', '2024-08-02', 8, 'IT'),
  (3, 'Charlie', '2024-08-02', 5, 'Finance'),
  (4, 'David', '2024-08-02', 8, 'IT'),
  (4, 'David', '2024-08-03', 6, 'IT');
