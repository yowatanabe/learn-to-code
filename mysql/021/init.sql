-- データベースの作成
CREATE DATABASE ShopDB;

-- データベースの選択
USE ShopDB;

-- Ordersテーブルの作成
CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Orders (CustomerName, OrderDate, TotalAmount, Status)
VALUES
  ('Alice', '2024-08-17', 250.00, 'Shipped'),
  ('Bob', '2024-08-18', 150.00, 'Processing'),
  ('Charlie', '2024-08-19', 300.00, 'Shipped'),
  ('David', '2024-08-20', 100.00, 'Cancelled');
