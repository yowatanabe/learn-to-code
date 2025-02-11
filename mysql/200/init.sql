-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,            -- 商品価格
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,  -- 主キー
    product_id INT,                           -- 外部キー
    quantity INT NOT NULL,                    -- 購入数量
    order_date DATE NOT NULL,                 -- 購入日
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 初期データ挿入
INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 1000.00),
('Smartphone', 'Electronics', 800.00),
('Headphones', 'Accessories', 200.00),
('Tablet', 'Electronics', 500.00),
('Smartwatch', 'Accessories', 300.00);

INSERT INTO orders (product_id, quantity, order_date) VALUES
(1, 5, '2024-02-01'),
(1, 3, '2024-02-02'),
(2, 7, '2024-02-01'),
(3, 10, '2024-02-01'),
(4, 4, '2024-02-01'),
(5, 6, '2024-02-01'),
(5, 2, '2024-02-02');
