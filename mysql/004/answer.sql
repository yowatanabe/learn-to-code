-- データベースの作成
CREATE DATABASE CompanyInventoryDB;

-- データベースの選択
USE CompanyInventoryDB;

-- Suppliersテーブルの作成
CREATE TABLE
  Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100) NOT NULL
  );

-- Productsテーブルの作成
CREATE TABLE
  Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT,
    QuantityInStock INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
  );

-- Ordersテーブルの作成
CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    OrderDate DATE,
    QuantityOrdered INT,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

-- Suppliersテーブルへのデータ挿入
INSERT INTO
  Suppliers (SupplierName, ContactEmail)
VALUES
  ('Supplier A', 'contact@supplierA.com'),
  ('Supplier B', 'contact@supplierB.com'),
  ('Supplier C', 'contact@supplierC.com');

-- Productsテーブルへのデータ挿入
INSERT INTO
  Products (ProductName, SupplierID, QuantityInStock)
VALUES
  ('Product 1', 1, 100),
  ('Product 2', 2, 200),
  ('Product 3', 3, 300);

-- Ordersテーブルへのデータ挿入
INSERT INTO
  Orders (ProductID, OrderDate, QuantityOrdered)
VALUES
  (1, '2024-07-10', 10),
  (2, '2024-07-15', 20),
  (3, '2024-07-20', 30);
