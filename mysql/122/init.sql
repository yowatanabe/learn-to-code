-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    OrderDate DATETIME
  );

-- 初期データ挿入
INSERT INTO
  Orders (CustomerID, OrderAmount, OrderDate)
VALUES
  (1, 100.00, '2024-11-01 10:00:00'),
  (2, 200.00, '2024-11-02 14:00:00'),
  (1, 50.00, '2024-11-03 16:00:00'),
  (3, 300.00, '2024-11-04 18:00:00');
