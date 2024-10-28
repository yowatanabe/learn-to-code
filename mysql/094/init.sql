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
  Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100)
  );

CREATE TABLE
  Purchases (
    PurchaseID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    PurchaseDate DATE,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Price)
VALUES
  (1, 'Smartphone', 699),
  (2, 'Laptop', 1200),
  (3, 'Headphones', 199),
  (4, 'Camera', 549);

INSERT INTO
  Customers (CustomerID, CustomerName, Email)
VALUES
  (1, 'John Doe', 'john@example.com'),
  (2, 'Jane Smith', 'jane@example.com'),
  (3, 'Charlie Brown', 'charlie@example.com'),
  (4, 'Alice Johnson', 'alice@example.com');

INSERT INTO
  Purchases (
    PurchaseID,
    ProductID,
    CustomerID,
    PurchaseDate,
    Quantity
  )
VALUES
  (101, 1, 1, '2024-10-29', 1),
  (102, 2, 2, '2024-10-30', 2),
  (103, 1, 3, '2024-10-31', 1),
  (104, 3, 1, '2024-11-01', 1),
  (105, 4, 4, '2024-11-02', 1);
