-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255)
  );

CREATE TABLE
  Salaries (
    EmployeeID INT PRIMARY KEY,
    CurrentSalary DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
  );

CREATE TABLE
  SalaryChanges (
    ChangeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    OldSalary DECIMAL(10, 2),
    NewSalary DECIMAL(10, 2),
    ChangeDate DATETIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
  );

-- 初期データ挿入
INSERT INTO
  Employees (EmployeeID, EmployeeName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Salaries (EmployeeID, CurrentSalary)
VALUES
  (1, 5000),
  (2, 4500),
  (3, 4000);
