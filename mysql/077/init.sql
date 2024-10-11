-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Tables (TableID INT PRIMARY KEY, TableName VARCHAR(100));

CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY,
    TableID INT,
    OrderDate DATE,
    FOREIGN KEY (TableID) REFERENCES Tables (TableID)
  );

CREATE TABLE
  OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ItemName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
  );

-- 初期データ挿入
INSERT INTO
  Tables (TableID, TableName)
VALUES
  (1, 'Table 1'),
  (2, 'Table 2'),
  (3, 'Table 3');

INSERT INTO
  Orders (OrderID, TableID, OrderDate)
VALUES
  (101, 1, '2024-09-12'),
  (102, 2, '2024-09-12'),
  (103, 3, '2024-09-13'),
  (104, 1, '2024-09-14'),
  (105, 2, '2024-09-14');

INSERT INTO
  OrderItems (OrderItemID, OrderID, ItemName, Quantity, Price)
VALUES
  (1001, 101, 'Pizza', 2, 1200),
  (1002, 101, 'Salad', 1, 800),
  (1003, 102, 'Burger', 3, 1000),
  (1004, 103, 'Pasta', 1, 1100),
  (1005, 104, 'Pizza', 2, 1200),
  (1006, 105, 'Burger', 2, 1000),
  (1007, 105, 'Soda', 2, 500);
