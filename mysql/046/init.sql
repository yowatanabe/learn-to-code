-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountNumber VARCHAR(20),
    Balance DECIMAL(10, 2)
  ) ENGINE = InnoDB;

CREATE TABLE
  AccountsHash (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountNumber VARCHAR(20),
    Balance DECIMAL(10, 2)
  ) ENGINE = MEMORY;

-- 初期データの挿入
INSERT INTO
  Accounts (AccountID, CustomerID, AccountNumber, Balance)
VALUES
  (1, 1001, '1234567890', 5000.00),
  (2, 1002, '1234567891', 1500.00),
  (3, 1003, '1234567892', 3000.00),
  (4, 1004, '1234567893', 4500.00),
  (5, 1005, '1234567894', 2500.00);

INSERT INTO
  AccountsHash (AccountID, CustomerID, AccountNumber, Balance)
VALUES
  (1, 1001, '1234567890', 5000.00),
  (2, 1002, '1234567891', 1500.00),
  (3, 1003, '1234567892', 3000.00),
  (4, 1004, '1234567893', 4500.00),
  (5, 1005, '1234567894', 2500.00);
