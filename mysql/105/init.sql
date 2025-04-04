-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Inventory (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Stock INT
  );

-- 初期データ挿入
INSERT INTO
  Inventory (ProductID, ProductName, Stock)
VALUES
  (1, 'Camera', 15),
  (2, 'Laptop', 10),
  (3, 'Smartphone', 25);
