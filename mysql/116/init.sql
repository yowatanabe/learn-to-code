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
    Stock INT
  );

-- 初期データ挿入
INSERT INTO
  Products (ProductID, ProductName, Stock)
VALUES
  (1, 'Book', 50),
  (2, 'Pen', 30),
  (3, 'Notebook', 20);
