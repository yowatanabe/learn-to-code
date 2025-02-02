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
    category VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    product_id INT,                          -- 外部キー
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 初期データ挿入
INSERT INTO products (product_name, price, category) VALUES
('Laptop', 1200.00, 'Electronics'),
('Smartphone', 800.00, 'Electronics'),
('Headphones', 200.00, 'Accessories'),
('Smartwatch', 300.00, 'Accessories'),
('Tablet', 600.00, 'Electronics');

INSERT INTO orders (product_id, quantity, order_date) VALUES
(1, 2, '2024-01-10'),
(1, 1, '2024-01-12'),
(2, 3, '2024-01-15'),
(3, 1, '2024-01-18'),
(3, 4, '2024-01-20'),
(4, 2, '2024-01-22'),
(5, 1, '2024-01-25'),
(5, 3, '2024-01-26'),
(5, 2, '2024-01-27');
