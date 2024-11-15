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
    Version INT
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Stock, Version)
VALUES
  (1, 'TV', 15, 1),
  (2, 'Laptop', 10, 1),
  (3, 'Smartphone', 5, 1);
