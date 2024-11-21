-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(255),
    RegistrationDate DATETIME
  );

CREATE TABLE
  Messages (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Message TEXT,
    CreatedAt DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
  );

-- 初期データ挿入
INSERT INTO
  Customers (CustomerName, Email, RegistrationDate)
VALUES
  (
    'Alice Smith',
    'alice@example.com',
    '2024-11-01 10:00:00'
  );
