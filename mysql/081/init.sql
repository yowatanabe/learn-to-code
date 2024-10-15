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
  (1, 'Laptop', 'Electronics', 1000),
  (2, 'Smartphone', 'Electronics', 800),
  (3, 'Desk Chair', 'Furniture', 200),
  (4, 'Table', 'Furniture', 300);

INSERT INTO
  Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
  (101, 1, 3, '2024-10-01'),
  (102, 2, 5, '2024-10-01'),
  (103, 3, 2, '2024-10-02'),
  (104, 4, 4, '2024-10-02'),
  (105, 1, 1, '2024-10-03');
