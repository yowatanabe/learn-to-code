-- データベースの作成
CREATE DATABASE StoreDB;

-- データベースの選択
USE StoreDB;

-- Productsテーブルの作成
CREATE TABLE
  Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Products (ProductName, Category, Price)
VALUES
  ('Laptop', 'Electronics', 1000.00),
  ('Mouse', 'Accessories', 20.00),
  ('Keyboard', 'Accessories', 50.00);
