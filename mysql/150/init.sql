-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    user_id INT,
    quantity INT,
    order_date DATETIME
    -- FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 初期データ挿入
INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 1500.00),
('Headphones', 'Electronics', 200.00),
('Smartphone', 'Electronics', 1000.00),
('Tablet', 'Electronics', 800.00),
('Chair', 'Furniture', 120.00),
('Desk', 'Furniture', 250.00),
('Shoes', 'Fashion', 80.00),
('Jacket', 'Fashion', 150.00),
('Watch', 'Accessories', 500.00),
('Backpack', 'Accessories', 100.00);

INSERT INTO orders (product_id, user_id, quantity, order_date)
SELECT
    FLOOR(RAND()*10) + 1,                   -- product_id: 1～10
    FLOOR(RAND()*1000) + 1,                -- user_id: 1～1000
    FLOOR(RAND()*5) + 1,                   -- quantity: 1～5
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*30) DAY) -- 過去30日のランダム日時
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2;
