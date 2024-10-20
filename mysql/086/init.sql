-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10, 2)
  );

CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Category, Price)
VALUES
  (1, 'Laptop', 'Electronics', 1000),
  (2, 'Smartphone', 'Electronics', 800),
  (3, 'Desk Chair', 'Furniture', 150),
  (4, 'Table', 'Furniture', 300);

INSERT INTO
  Orders (OrderID, ProductID, OrderDate, Quantity)
VALUES
  (101, 1, '2024-10-01', 2),
  (102, 2, '2024-10-02', 1),
  (103, 3, '2024-10-03', 4),
  (104, 1, '2024-10-03', 1);
