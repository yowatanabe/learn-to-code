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

CREATE TABLE work_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_id INT,                        -- 外部キー
    work_date DATE NOT NULL,
    hours_worked DECIMAL(5,2) NOT NULL,      -- 勤務時間
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 初期データ挿入
INSERT INTO employees (employee_name, department, hire_date) VALUES
('Alice', 'Engineering', '2020-01-15'),
('Bob', 'Marketing', '2019-06-01'),
('Charlie', 'HR', '2021-03-10'),
('Diana', 'Sales', '2018-07-25'),
('Eve', 'IT Support', '2022-01-10');

INSERT INTO work_logs (employee_id, work_date, hours_worked) VALUES
(1, '2024-02-01', 8.0),
(1, '2024-02-02', 7.5),
(2, '2024-02-01', 6.0),
(2, '2024-02-02', 6.5),
(3, '2024-02-01', 7.0),
(3, '2024-02-02', 7.5),
(3, '2024-02-03', 8.0),
(4, '2024-02-01', 5.0),
(4, '2024-02-02', 6.0),
(5, '2024-02-01', 9.0),
(5, '2024-02-02', 9.5),
(5, '2024-02-03', 10.0);
