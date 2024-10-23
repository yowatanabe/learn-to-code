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
  (1, 'Laptop', 1500),
  (2, 'Mouse', 25),
  (3, 'Keyboard', 50),
  (4, 'Monitor', 300);

INSERT INTO
  Orders (OrderID, ProductID, OrderDate, Quantity)
VALUES
  (101, 1, '2024-10-24', 3),
  (102, 2, '2024-10-25', 10),
  (103, 3, '2024-10-26', 5),
  (104, 4, '2024-10-27', 2);

INSERT INTO
  Customers (CustomerID, CustomerName)
VALUES
  (1, 'John Doe'),
  (2, 'Jane Smith'),
  (3, 'Alice Brown');
