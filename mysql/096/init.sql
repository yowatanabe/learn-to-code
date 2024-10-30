-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Accounts (
    AccountID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Balance DECIMAL(10, 2)
  );

-- 初期データ挿入
INSERT INTO
  Accounts (AccountID, CustomerName, Balance)
VALUES
  (1, 'Alice', 5000),
  (2, 'Bob', 3000),
  (3, 'Carol', 7000);
