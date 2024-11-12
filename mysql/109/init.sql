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
    Stock INT,
    INDEX (ProductID)
  );

CREATE TABLE
  Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Stock)
VALUES
  (1, 'TV', 15),
  (2, 'Laptop', 10),
  (3, 'Smartphone', 20);
