-- データベースの作成
CREATE DATABASE SalesDB;

-- データベースの選択
USE SalesDB;

-- Ordersテーブルの作成
CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    OrderDate DATETIME NOT NULL,
    OrderAmount DECIMAL(10, 2) NOT NULL,
    ProductCategory VARCHAR(100) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Orders (
    CustomerName,
    OrderDate,
    OrderAmount,
    ProductCategory
  )
VALUES
  (
    'Alice',
    '2024-08-01 10:15:00',
    150.00,
    'Electronics'
  ),
  (
    'Bob',
    '2024-08-01 11:30:00',
    200.00,
    'Home Appliances'
  ),
  (
    'Charlie',
    '2024-08-02 09:45:00',
    300.00,
    'Electronics'
  ),
  (
    'David',
    '2024-08-03 14:20:00',
    400.00,
    'Furniture'
  ),
  (
    'Eve',
    '2024-08-03 15:30:00',
    100.00,
    'Home Appliances'
  );
