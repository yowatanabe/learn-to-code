-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
  );

CREATE TABLE
  Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
  );

-- 初期データ挿入
INSERT INTO
  Customers (CustomerID, CustomerName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Subscriptions (SubscriptionID, CustomerID, Amount, PaymentDate)
VALUES
  (101, 1, 1000, '2024-10-15'),
  (102, 2, 1500, '2024-10-20'),
  (103, 3, 1200, '2024-10-25'),
  (104, 1, 1000, '2024-11-15'),
  (105, 2, 1500, '2024-11-20'),
  (106, 3, 1200, '2024-11-25');
