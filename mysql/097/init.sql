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
    Stock INT CHECK (Stock >= 0)
  );

CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Stock)
VALUES
  (1, 'Laptop', 10),
  (2, 'Mouse', 25),
  (3, 'Keyboard', 15),
  (4, 'Monitor', 8);

INSERT INTO
  Orders (OrderID, ProductID, Quantity)
VALUES
  (1001, 1, 2),
  (1002, 2, 1),
  (1003, 4, 10);
