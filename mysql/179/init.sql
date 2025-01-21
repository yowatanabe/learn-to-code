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

CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    customer_id INT,                          -- 外部キー
    issue_type VARCHAR(100) NOT NULL,
    status ENUM('Open', 'In Progress', 'Resolved') NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 初期データ挿入
INSERT INTO customers (customer_name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('Diana', 'diana@example.com'),
('Eve', 'eve@example.com');

INSERT INTO tickets (customer_id, issue_type, status)
SELECT
    FLOOR(RAND()*5) + 1,                     -- customer_id: 1～5
    ELT(FLOOR(RAND()*3) + 1, 'Billing', 'Technical', 'General'), -- ランダムな種類
    ELT(FLOOR(RAND()*3) + 1, 'Open', 'In Progress', 'Resolved') -- ランダムなステータス
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2;
