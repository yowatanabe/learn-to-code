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
  Products (ProductID, ProductName, Price)
VALUES
  (1, 'Laptop', 1000),
  (2, 'Smartphone', 700),
  (3, 'Tablet', 500);

INSERT INTO
  Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
  (101, 1, 5, '2024-10-01'),
  (102, 1, 3, '2024-10-05'),
  (103, 2, 10, '2024-10-07'),
  (104, 3, 7, '2024-10-10'),
  (105, 2, 4, '2024-10-12');
