-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(100),
    Balance DECIMAL(10, 2),
    Version INT DEFAULT 1
  );

-- 初期データ挿入
INSERT INTO
  Accounts (AccountID, AccountHolder, Balance, Version)
VALUES
  (1, 'Alice', 1000, 1),
  (2, 'Bob', 2000, 1),
  (3, 'Charlie', 1500, 1);
