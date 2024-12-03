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
  InventoryLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    OldStock INT,
    NewStock INT,
    ChangeDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Inventory (ProductID)
  );

-- 初期データ挿入
INSERT INTO
  Inventory (ProductID, ProductName, Stock)
VALUES
  (1, 'Smartphone', 50),
  (2, 'Laptop', 20),
  (3, 'Headphones', 100);
