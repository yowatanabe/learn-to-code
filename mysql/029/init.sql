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
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Products (ProductName, Category, Price, StockQuantity)
VALUES
  ('Laptop', 'Electronics', 1200.00, 10),
  ('Smartphone', 'Electronics', 800.00, 20),
  ('Coffee Maker', 'Home Appliances', 150.00, 15),
  ('Blender', 'Home Appliances', 100.00, 30),
  ('Tablet', 'Electronics', 600.00, 25);
