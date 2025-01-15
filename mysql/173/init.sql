-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL, -- 部門
    hire_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_id INT,                          -- 外部キー
    salary DECIMAL(10, 2) NOT NULL,          -- 給与
    effective_date DATE NOT NULL,            -- 適用開始日
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 初期データ挿入
INSERT INTO employees (name, department, hire_date) VALUES
('Alice', 'Engineering', '2019-01-15'),
('Bob', 'Engineering', '2018-06-01'),
('Charlie', 'Marketing', '2020-03-10'),
('Diana', 'Marketing', '2021-07-01'),
('Eve', 'Sales', '2017-11-25'),
('Frank', 'Sales', '2022-01-10');

INSERT INTO salaries (employee_id, salary, effective_date) VALUES
(1, 7500.00, '2023-01-01'),
(2, 8000.00, '2023-01-01'),
(3, 6500.00, '2023-01-01'),
(4, 7000.00, '2023-01-01'),
(5, 9000.00, '2023-01-01'),
(6, 8500.00, '2023-01-01');
