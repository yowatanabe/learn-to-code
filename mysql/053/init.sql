-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    Status VARCHAR(50),
    TotalAmount DECIMAL(10, 2)
  );

-- 初期データ挿入
INSERT INTO
  Orders (
    OrderID,
    CustomerName,
    OrderDate,
    Status,
    TotalAmount
  )
VALUES
  (1, 'Alice', '2024-09-01', 'Shipped', 100.00),
  (2, 'Bob', '2024-09-02', 'Pending', 200.00),
  (3, 'Charlie', '2024-09-03', 'Shipped', 150.00),
  (4, 'David', '2024-09-04', 'Delivered', 300.00),
  (5, 'Eve', '2024-09-05', 'Pending', 50.00);
