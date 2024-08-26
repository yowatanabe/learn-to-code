-- 第1正規形 (1NF)
-- 1NFの要件を満たすために、テーブル内の各フィールドが単一値を保持するようにし、重複するグループを取り除きます。
CREATE TABLE
  Orders_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    TotalAmount DECIMAL(10, 2),
    CustomerAddress VARCHAR(255)
  );

INSERT INTO
  Orders_1NF (
    OrderID,
    CustomerName,
    Product,
    TotalAmount,
    CustomerAddress
  )
VALUES
  (1, 'Alice', 'Laptop', 1200.00, '123 Main St'),
  (2, 'Bob', 'Smartphone', 1400.00, '456 Oak St'),
  (2, 'Bob', 'Tablet', 1400.00, '456 Oak St'),
  (3, 'Charlie', 'Blender', 250.00, '789 Pine St'),
  (
    3,
    'Charlie',
    'Coffee Maker',
    250.00,
    '789 Pine St'
  );

-- 第2正規形 (2NF)
-- 2NFの要件を満たすために、部分関数従属性を排除します。ここでは、顧客情報と注文情報を別のテーブルに分割します。
CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    CustomerAddress VARCHAR(255)
  );

CREATE TABLE
  Orders_2NF (
    OrderID INT,
    CustomerID INT,
    Product VARCHAR(100),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
  );

INSERT INTO
  Customers (CustomerName, CustomerAddress)
VALUES
  ('Alice', '123 Main St'),
  ('Bob', '456 Oak St'),
  ('Charlie', '789 Pine St');

INSERT INTO
  Orders_2NF (OrderID, CustomerID, Product, TotalAmount)
VALUES
  (1, 1, 'Laptop', 1200.00),
  (2, 2, 'Smartphone', 1400.00),
  (2, 2, 'Tablet', 1400.00),
  (3, 3, 'Blender', 250.00),
  (3, 3, 'Coffee Maker', 250.00);

-- 第3正規形 (3NF)
-- 3NFの要件を満たすために、推移的関数従属性を排除します。ここでは、注文テーブルから商品と価格の関係を別のテーブルに分割します。
CREATE TABLE
  Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
  );

CREATE TABLE
  Orders_3NF (
    OrderID INT,
    CustomerID INT,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

INSERT INTO
  Products (ProductName, Price)
VALUES
  ('Laptop', 1200.00),
  ('Smartphone', 800.00),
  ('Tablet', 600.00),
  ('Blender', 100.00),
  ('Coffee Maker', 150.00);

INSERT INTO
  Orders_3NF (OrderID, CustomerID, ProductID)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (2, 2, 3),
  (3, 3, 4),
  (3, 3, 5);
