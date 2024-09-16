-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
  );

-- 初期データ挿入
INSERT INTO
  orders (customer_id, order_date, status, total_amount)
VALUES
  (12345, '2023-01-01', 'Shipped', 100.00),
  (12345, '2023-01-05', 'Pending', 200.00),
  (12345, '2023-01-10', 'Shipped', 150.00),
  (54321, '2023-01-03', 'Shipped', 250.00),
  (12345, '2023-01-15', 'Shipped', 300.00),
  (54321, '2023-01-20', 'Cancelled', 100.00),
  (12345, '2023-02-01', 'Shipped', 200.00),
  (54321, '2023-02-05', 'Shipped', 150.00),
  (12345, '2023-02-10', 'Pending', 250.00),
  (54321, '2023-02-15', 'Shipped', 100.00);
