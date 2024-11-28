-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Price DECIMAL(10, 2)
  );

CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    OrderDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Price)
VALUES
  (1, 'Smartphone', 700.00),
  (2, 'Laptop', 1200.00),
  (3, 'Headphones', 150.00);

INSERT INTO
  Orders (OrderID, ProductID, Quantity, OrderDate)
VALUES
  (1, 1, 2, '2024-10-01 10:00:00'),
  (2, 1, 1, '2024-10-15 12:00:00'),
  (3, 2, 3, '2024-10-20 14:00:00'),
  (4, 3, 5, '2024-11-05 16:00:00'),
  (5, 1, 4, '2024-11-10 18:00:00');
