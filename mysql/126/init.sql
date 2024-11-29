-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Inventory (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Stock INT
  );

CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    Quantity INT,
    OrderDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Inventory (ProductID)
  );

-- 初期データ挿入
INSERT INTO
  Inventory (ProductID, ProductName, Stock)
VALUES
  (1, 'Smartphone', 10),
  (2, 'Laptop', 5),
  (3, 'Headphones', 20);

INSERT INTO
  Orders (ProductID, Quantity, OrderDate)
VALUES
  (1, 2, '2024-11-01 10:00:00');
