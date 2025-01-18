-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    customer_id INT,                         -- 外部キー
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,    -- 注文の合計金額
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 初期データ挿入
INSERT INTO customers (customer_name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('Diana', 'diana@example.com'),
('Eve', 'eve@example.com');

INSERT INTO orders (customer_id, order_date, total_amount)
SELECT
    FLOOR(RAND()*5) + 1,                              -- customer_id: 1～5
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*30) DAY),  -- 過去30日間のランダム日時
    ROUND(RAND()*500 + 50, 2)                         -- 合計金額: 50～550のランダム値
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2;
