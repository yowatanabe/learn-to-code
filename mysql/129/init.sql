-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    DaysPresent INT DEFAULT 0
  );

CREATE TABLE
  Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    AttendanceDate DATETIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID)
  );

-- 初期データ挿入
INSERT INTO
  Employees (EmployeeID, EmployeeName, DaysPresent)
VALUES
  (1, 'Alice', 0),
  (2, 'Bob', 0),
  (3, 'Charlie', 0);

INSERT INTO
  Attendance (EmployeeID, AttendanceDate)
VALUES
  (1, '2024-12-03 08:00:00');
