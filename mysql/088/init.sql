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
  Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
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
  Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
  (101, 1, '2024-10-01', 500),
  (102, 2, '2024-10-02', 300),
  (103, 3, '2024-10-02', 150),
  (104, 1, '2024-10-03', 200);
