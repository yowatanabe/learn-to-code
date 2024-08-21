-- データベースの作成
CREATE DATABASE StoreDB;

-- データベースの選択
USE StoreDB;

-- Salesテーブルの作成
CREATE TABLE
  Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    SaleDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Sales (ProductName, SaleDate, Quantity, TotalAmount)
VALUES
  ('Laptop', '2024-08-01', 2, 2400.00),
  ('Smartphone', '2024-08-01', 5, 3000.00),
  ('Laptop', '2024-08-02', 1, 1200.00),
  ('Tablet', '2024-08-03', 3, 1500.00),
  ('Smartphone', '2024-08-03', 2, 1200.00);
