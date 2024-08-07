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
    TotalAmount DECIMAL(10, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Orders (CustomerName, OrderDate, TotalAmount)
VALUES
  ('Alice', '2024-01-15', 250.00),
  ('Bob', '2024-02-20', 150.00),
  ('Charlie', '2024-03-05', 300.00);

-- すべての注文の顧客名と注文日を選択するクエリ
SELECT
  CustomerName,
  OrderDate
FROM
  Orders;

-- 特定の日付以降の注文を選択するクエリ（例: 2023-02-01以降の注文）
SELECT
  CustomerName,
  OrderDate
FROM
  Orders
WHERE
  OrderDate >= '2024-02-01';

-- 新しい注文を追加するクエリ
INSERT INTO
  Orders (CustomerName, OrderDate, TotalAmount)
VALUES
  ('David', '2024-04-10', 200.00);

-- 特定の注文の金額を更新するクエリ（例: Bobの注文の金額を180.00に更新）
UPDATE Orders
SET
  TotalAmount = 180.00
WHERE
  CustomerName = 'Bob';

-- 特定の注文を削除するクエリ（例: Charlieの注文を削除）
DELETE FROM Orders
WHERE
  CustomerName = 'Charlie';
