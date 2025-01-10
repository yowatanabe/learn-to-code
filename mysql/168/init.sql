-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    product_id INT,                          -- 外部キー
    customer_name VARCHAR(100) NOT NULL,
    order_date DATETIME NOT NULL,
    quantity INT NOT NULL
    -- FOREIGN KEY (product_id) REFERENCES products(product_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO products (product_name, price) VALUES
('Laptop', 1500.00),
('Smartphone', 800.00),
('Headphones', 200.00),
('Smartwatch', 300.00),
('Tablet', 600.00);

INSERT INTO orders (product_id, customer_name, order_date, quantity)
SELECT
    FLOOR(RAND()*5) + 1,                          -- product_id: 1～5
    CONCAT('Customer_', FLOOR(RAND()*100)),       -- customer_name
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*60) DAY), -- 過去60日間のランダム日時
    FLOOR(RAND()*10) + 1                          -- quantity: 1～10
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
