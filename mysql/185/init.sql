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

CREATE TABLE salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_id INT,                          -- 外部キー
    salary DECIMAL(10, 2) NOT NULL,           -- 給与金額
    effective_date DATE NOT NULL,             -- 適用開始日
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);

-- 初期データ挿入
INSERT INTO employees (employee_name, department, hire_date) VALUES
('Alice', 'Engineering', '2020-01-15'),
('Bob', 'Marketing', '2019-06-01'),
('Charlie', 'HR', '2021-03-10'),
('Diana', 'Sales', '2018-07-25'),
('Eve', 'IT Support', '2022-01-10');

INSERT INTO salaries (employee_id, salary, effective_date) VALUES
(1, 7000.00, '2023-01-01'),
(1, 7500.00, '2024-01-01'),
(2, 5000.00, '2023-01-01'),
(3, 4000.00, '2023-01-01'),
(3, 4500.00, '2024-01-01'),
(4, 6000.00, '2023-01-01'),
(5, 3500.00, '2023-01-01');
