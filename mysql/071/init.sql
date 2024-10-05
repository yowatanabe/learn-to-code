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
  Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
  );

CREATE TABLE
  Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
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

CREATE TABLE
  ShippingStatus (
    OrderID INT PRIMARY KEY,
    Status VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
  );

-- 初期データ挿
INSERT INTO
  Customers (CustomerID, CustomerName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Orders (OrderID, CustomerID, OrderDate)
VALUES
  (101, 1, '2024-10-01'),
  (102, 2, '2024-10-02'),
  (103, 3, '2024-10-03');

INSERT INTO
  Products (ProductID, ProductName, Price)
VALUES
  (201, 'Laptop', 1000),
  (202, 'Smartphone', 700),
  (203, 'Tablet', 500);

INSERT INTO
  OrderItems (OrderItemID, OrderID, ProductID, Quantity)
VALUES
  (301, 101, 201, 1),
  (302, 101, 202, 2),
  (303, 102, 203, 1),
  (304, 103, 201, 1),
  (305, 103, 202, 1);

INSERT INTO
  ShippingStatus (OrderID, Status)
VALUES
  (101, 'Delivered'),
  (102, 'Shipped'),
  (103, 'Processing');
