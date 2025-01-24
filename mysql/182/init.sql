-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    department_name VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    department_id INT,                          -- 外部キー
    employee_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE
);

-- 初期データ挿入
INSERT INTO departments (department_name) VALUES
('Engineering'),
('Marketing'),
('HR'),
('Sales');

INSERT INTO employees (department_id, employee_name, job_title, hire_date) VALUES
(1, 'Alice', 'Software Engineer', '2020-01-15'),
(1, 'Bob', 'DevOps Engineer', '2019-03-10'),
(2, 'Charlie', 'Marketing Specialist', '2021-05-20'),
(2, 'Diana', 'Content Creator', '2022-02-01'),
(3, 'Eve', 'HR Manager', '2018-11-10'),
(4, 'Frank', 'Sales Representative', '2023-07-01');
