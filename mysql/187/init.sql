-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE assets (
    asset_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    asset_name VARCHAR(100) NOT NULL,
    asset_type VARCHAR(50) NOT NULL,
    purchase_date DATE NOT NULL,
    status ENUM('Available', 'In Use', 'Maintenance') NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE asset_usage (
    usage_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    asset_id INT,                            -- 外部キー
    employee_name VARCHAR(100) NOT NULL,
    usage_start DATE NOT NULL,
    usage_end DATE,
    FOREIGN KEY (asset_id) REFERENCES assets(asset_id) ON DELETE CASCADE
);

-- 初期データ挿入
INSERT INTO assets (asset_name, asset_type, purchase_date, status) VALUES
('Laptop A', 'Laptop', '2023-01-15', 'Available'),
('Projector X', 'Projector', '2022-06-10', 'In Use'),
('Printer Z', 'Printer', '2021-12-01', 'Maintenance');

INSERT INTO asset_usage (asset_id, employee_name, usage_start, usage_end) VALUES
(1, 'Alice', '2024-02-01', '2024-02-05'),
(1, 'Bob', '2024-02-06', NULL),
(2, 'Charlie', '2024-01-20', '2024-01-25'),
(3, 'Diana', '2024-02-10', NULL);
