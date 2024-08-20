-- データベースの作成
CREATE DATABASE FinanceDB;

-- データベースの選択
USE FinanceDB;

-- Transactionsテーブルの作成
CREATE TABLE
  Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    TransactionDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Transactions (
    CustomerName,
    TransactionDate,
    Amount,
    PaymentMethod
  )
VALUES
  ('Alice', '2024-08-01', 150.50, 'Credit Card'),
  ('Bob', '2024-08-02', 75.00, 'PayPal'),
  ('Charlie', '2024-08-05', 200.00, 'Credit Card'),
  ('David', '2024-08-07', 300.00, 'Bank Transfer'),
  ('Eve', '2024-08-09', 50.00, 'PayPal');
