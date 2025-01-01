-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inquiries (
    inquiry_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    customer_id INT,                           -- 外部キー
    inquiry_date DATE NOT NULL,
    inquiry_text TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO customers (name, email) VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com'),
('Diana Prince', 'diana@example.com'),
('Eve Adams', 'eve@example.com');

-- 問い合わせ履歴データを挿入
INSERT INTO inquiries (customer_id, inquiry_date, inquiry_text) VALUES
(1, '2023-12-01', 'How do I reset my password?'),
(2, '2023-12-02', 'Where can I find my order history?'),
(1, '2023-12-03', 'I need help with my account.'),
(3, '2023-12-04', 'Can I change my email address?'),
(4, '2023-12-05', 'I am having trouble logging in.'),
(5, '2023-12-06', 'How do I update my profile information?'),
(1, '2023-12-07', 'What are your support hours?');
