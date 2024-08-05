-- データベースの作成
CREATE DATABASE ShopDB;

-- データベースの選択
USE ShopDB;

-- Customersテーブルの作成
CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Age INT NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Customers (CustomerName, Email, Age)
VALUES
  ('Alice', 'alice@example.com', 30),
  ('Bob', 'bob@example.com', 25),
  ('Charlie', 'charlie@example.com', 35);
