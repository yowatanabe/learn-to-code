-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bonuses (
    bonus_id INT AUTO_INCREMENT PRIMARY KEY,   -- 主キー
    employee_id INT,                           -- 外部キー
    bonus_amount DECIMAL(10, 2) NOT NULL,      -- 賞与金額
    awarded_date DATE NOT NULL,                -- 賞与支給日
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 初期データ挿入
INSERT INTO employees (employee_name, department, hire_date) VALUES
('Alice', 'Engineering', '2020-01-15'),
('Bob', 'Marketing', '2019-06-01'),
('Charlie', 'HR', '2021-03-10'),
('Diana', 'Sales', '2018-07-25'),
('Eve', 'IT Support', '2022-01-10');

INSERT INTO bonuses (employee_id, bonus_amount, awarded_date) VALUES
(1, 1000.00, '2024-02-01'),
(1, 1500.00, '2024-03-01'),
(2, 1200.00, '2024-02-01'),
(2, 800.00, '2024-03-01'),
(3, 500.00, '2024-02-01'),
(3, 600.00, '2024-03-01'),
(4, 2000.00, '2024-02-01'),
(5, 2500.00, '2024-02-01'),
(5, 1800.00, '2024-03-01');
