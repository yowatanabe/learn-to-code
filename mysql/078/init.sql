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
  OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    BookTitle VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
  );

-- 初期データ挿入
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
  (103, 3, '2024-10-03'),
  (104, 1, '2024-10-04'),
  (105, 2, '2024-10-05');

INSERT INTO
  OrderItems (OrderItemID, OrderID, BookTitle, Quantity, Price)
VALUES
  (1001, 101, 'Book A', 2, 1500),
  (1002, 101, 'Book B', 1, 2000),
  (1003, 102, 'Book C', 3, 1200),
  (1004, 103, 'Book D', 1, 1800),
  (1005, 104, 'Book A', 2, 1500),
  (1006, 105, 'Book E', 1, 2500);
