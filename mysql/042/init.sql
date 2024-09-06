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
    TotalAmount DECIMAL(10, 2)
  );

-- 初期データの挿入
INSERT INTO
  Orders (OrderID, CustomerName, OrderDate, TotalAmount)
VALUES
  (1, 'Alice', '2024-08-20', 100),
  (2, 'Bob', '2024-08-21', 200),
  (3, 'Charlie', '2024-08-22', 150),
  (4, 'Alice', '2024-08-23', 250),
  (5, 'Bob', '2024-08-24', 300);
