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
  Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    CustomerID INT,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Price)
VALUES
  (1, 'Laptop', 1200),
  (2, 'Mouse', 20),
  (3, 'Keyboard', 50),
  (4, 'Monitor', 300);

INSERT INTO
  Orders (
    OrderID,
    ProductID,
    OrderDate,
    Quantity,
    CustomerID
  )
VALUES
  (101, 1, '2024-10-15', 2, 1),
  (102, 2, '2024-10-16', 5, 2),
  (103, 3, '2024-10-16', 3, 3),
  (104, 4, '2024-10-17', 1, 1),
  (105, 1, '2024-10-18', 1, 2);

INSERT INTO
  Customers (CustomerID, CustomerName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');
