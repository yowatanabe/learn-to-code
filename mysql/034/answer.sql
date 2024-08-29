-- 第1正規形 (1NF)
-- 1NFの要件を満たすために、各フィールドが単一値を保持するようにし、重複するグループを取り除きます。
CREATE TABLE
  Orders_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Item VARCHAR(100),
    Price DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2),
    Address VARCHAR(255)
  );

INSERT INTO
  Orders_1NF (
    OrderID,
    CustomerName,
    Item,
    Price,
    TotalPrice,
    Address
  )
VALUES
  (1, 'Alice', 'Latte', 5.00, 8.00, '123 Main St'),
  (
    1,
    'Alice',
    'Croissant',
    3.00,
    8.00,
    '123 Main St'
  ),
  (2, 'Bob', 'Espresso', 3.00, 3.00, '456 Oak St'),
  (
    3,
    'Charlie',
    'Cappuccino',
    4.50,
    8.50,
    '789 Pine St'
  ),
  (3, 'Charlie', 'Muffin', 2.50, 8.50, '789 Pine St'),
  (3, 'Charlie', 'Cookie', 1.50, 8.50, '789 Pine St');

-- 第2正規形 (2NF)
-- 2NFの要件を満たすために、部分関数従属性を排除します。ここでは、顧客情報と注文情報を別のテーブルに分割します。
CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Address VARCHAR(255)
  );

CREATE TABLE
  Orders_2NF (
    OrderID INT,
    CustomerID INT,
    Item VARCHAR(100),
    Price DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
  );

INSERT INTO
  Customers (CustomerName, Address)
VALUES
  ('Alice', '123 Main St'),
  ('Bob', '456 Oak St'),
  ('Charlie', '789 Pine St');

INSERT INTO
  Orders_2NF (OrderID, CustomerID, Item, Price, TotalPrice)
VALUES
  (1, 1, 'Latte', 5.00, 8.00),
  (1, 1, 'Croissant', 3.00, 8.00),
  (2, 2, 'Espresso', 3.00, 3.00),
  (3, 3, 'Cappuccino', 4.50, 8.50),
  (3, 3, 'Muffin', 2.50, 8.50),
  (3, 3, 'Cookie', 1.50, 8.50);

-- 第3正規形 (3NF)
-- 3NFの要件を満たすために、推移的関数従属性を排除します。ここでは、アイテムと価格情報を別のテーブルに分割します。
CREATE TABLE
  Items (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    ItemName VARCHAR(100),
    Price DECIMAL(10, 2)
  );

CREATE TABLE
  Orders_3NF (
    OrderID INT,
    CustomerID INT,
    ItemID INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (ItemID) REFERENCES Items (ItemID)
  );

INSERT INTO
  Items (ItemName, Price)
VALUES
  ('Latte', 5.00),
  ('Croissant', 3.00),
  ('Espresso', 3.00),
  ('Cappuccino', 4.50),
  ('Muffin', 2.50),
  ('Cookie', 1.50);

INSERT INTO
  Orders_3NF (OrderID, CustomerID, ItemID, TotalPrice)
VALUES
  (1, 1, 1, 8.00),
  (1, 1, 2, 8.00),
  (2, 2, 3, 3.00),
  (3, 3, 4, 8.50),
  (3, 3, 5, 8.50),
  (3, 3, 6, 8.50);
