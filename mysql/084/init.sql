-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
  );

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
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
  );

CREATE TABLE
  OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

-- 初期データ挿入
INSERT INTO
  Customers (CustomerID, CustomerName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Products (ProductID, ProductName, Category, Price)
VALUES
  (101, 'Laptop', 'Electronics', 1200),
  (102, 'Phone', 'Electronics', 800),
  (103, 'Desk Chair', 'Furniture', 150),
  (104, 'Table', 'Furniture', 300);

INSERT INTO
  Orders (OrderID, CustomerID, OrderDate)
VALUES
  (1, 1, '2024-10-19'),
  (2, 2, '2024-10-20'),
  (3, 3, '2024-10-21');

INSERT INTO
  OrderItems (OrderItemID, OrderID, ProductID, Quantity)
VALUES
  (1, 1, 101, 2),
  (2, 1, 103, 4),
  (3, 2, 102, 1),
  (4, 3, 104, 2),
  (5, 3, 103, 1);
