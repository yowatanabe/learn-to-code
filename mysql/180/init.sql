-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    product_id INT,                         -- 外部キー
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,                  -- 売れた数量
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 初期データ挿入
INSERT INTO products (product_name, price) VALUES
('Laptop', 1500.00),
('Smartphone', 800.00),
('Headphones', 200.00),
('Smartwatch', 300.00),
('Tablet', 600.00);

INSERT INTO sales (product_id, sale_date, quantity)
SELECT
    FLOOR(RAND()*5) + 1,                          -- product_id: 1～5
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*30) DAY), -- 過去30日間のランダム日付
    FLOOR(RAND()*10) + 1                          -- 数量: 1～10
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2;
