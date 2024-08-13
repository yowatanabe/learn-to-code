-- データベースの作成
CREATE DATABASE InventoryDB;

-- データベースの選択
USE InventoryDB;

-- Productsテーブルの作成
CREATE TABLE
  Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    InStock BOOLEAN NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Products (ProductName, ReleaseDate, Price, InStock)
VALUES
  ('Laptop', '2023-11-01', 1200.00, TRUE),
  ('Smartphone', '2023-09-15', 800.00, FALSE),
  ('Tablet', '2024-01-20', 500.00, TRUE);
