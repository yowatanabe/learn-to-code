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
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
  );

CREATE TABLE
  Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Category, Price)
VALUES
  (1, 'Laptop', 'Electronics', 1000.00),
  (2, 'Phone', 'Electronics', 500.00),
  (3, 'Chair', 'Furniture', 150.00),
  (4, 'Desk', 'Furniture', 300.00),
  (5, 'Headphones', 'Electronics', 100.00);

INSERT INTO
  Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
  (1, 1, 5, '2024-09-01'),
  (2, 2, 10, '2024-09-02'),
  (3, 3, 15, '2024-09-03'),
  (4, 4, 8, '2024-09-04'),
  (5, 5, 20, '2024-09-05');
