-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    points INT DEFAULT 0
  );

CREATE TABLE
  purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    purchase_amount DECIMAL(10, 2),
    purchase_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
  );

-- 初期データ挿入
INSERT INTO
  customers (name, email, points)
VALUES
  ('Alice', 'alice@example.com', 50),
  ('Bob', 'bob@example.com', 20),
  ('Charlie', 'charlie@example.com', 0);
