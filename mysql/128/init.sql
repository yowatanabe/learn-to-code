-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    TotalSpent DECIMAL(10, 2)
  );

CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    OrderDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
  );

-- 初期データ挿入
INSERT INTO
  Customers (CustomerID, CustomerName, TotalSpent)
VALUES
  (1, 'Alice', 0.00),
  (2, 'Bob', 0.00),
  (3, 'Charlie', 0.00);

INSERT INTO
  Orders (CustomerID, OrderAmount, OrderDate)
VALUES
  (1, 100.00, '2024-12-02 10:00:00');
