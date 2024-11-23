-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(255),
    Status VARCHAR(20)
  );

-- 初期データ挿入
INSERT INTO
  Customers (CustomerName, Email, Status)
VALUES
  ('Alice Smith', 'alice@example.com', 'Active'),
  ('Bob Johnson', 'bob@example.com', 'Inactive'),
  ('Charlie Brown', 'charlie@example.com', 'Active');
