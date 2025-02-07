-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE support_tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    customer_id INT,                           -- 外部キー
    issue_description TEXT NOT NULL,
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed') NOT NULL,
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

INSERT INTO support_tickets (customer_id, issue_description, status) VALUES
(1, 'Cannot log in to account.', 'Resolved'),
(1, 'Payment issue with credit card.', 'Open'),
(2, 'Website is not loading.', 'In Progress'),
(2, 'Lost my password.', 'Closed'),
(2, 'Cannot update profile information.', 'Resolved'),
(3, 'Refund request for a purchase.', 'Open'),
(4, 'Two-factor authentication issue.', 'Closed'),
(5, 'Order tracking not updating.', 'Open'),
(5, 'Cannot apply discount code.', 'Resolved'),
(5, 'Live chat support not working.', 'In Progress'),
(5, 'Problem with email notifications.', 'Open');
