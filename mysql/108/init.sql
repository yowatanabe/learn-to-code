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
    Price DECIMAL(10, 2),
    INDEX (ProductID)
  );

CREATE TABLE
  PriceHistory (
    HistoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    OldPrice DECIMAL(10, 2),
    NewPrice DECIMAL(10, 2),
    ChangeDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Price)
VALUES
  (1, 'TV', 300),
  (2, 'Laptop', 1000),
  (3, 'Headphones', 150);
