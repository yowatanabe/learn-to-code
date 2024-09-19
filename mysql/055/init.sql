-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Status VARCHAR(50),
    TotalAmount DECIMAL(10, 2)
  );

-- 初期データ挿入
INSERT INTO
  Orders (
    OrderID,
    CustomerID,
    OrderDate,
    Status,
    TotalAmount
  )
VALUES
  (1, 101, '2024-09-01', 'Shipped', 150.00),
  (2, 102, '2024-09-02', 'Pending', 200.00),
  (3, 103, '2024-09-03', 'Delivered', 300.00),
  (4, 101, '2024-09-04', 'Cancelled', 100.00),
  (5, 102, '2024-09-05', 'Pending', 250.00);
