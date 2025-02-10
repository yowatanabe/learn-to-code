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

CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_id INT,                        -- 外部キー
    task_name VARCHAR(200) NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') NOT NULL,
    due_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 初期データ挿入
INSERT INTO employees (employee_name, department, hire_date) VALUES
('Alice', 'Engineering', '2020-01-15'),
('Bob', 'Marketing', '2019-06-01'),
('Charlie', 'HR', '2021-03-10'),
('Diana', 'Sales', '2018-07-25'),
('Eve', 'IT Support', '2022-01-10');

INSERT INTO tasks (employee_id, task_name, status, due_date) VALUES
(1, 'Design new feature', 'In Progress', '2024-03-15'),
(1, 'Fix bugs in code', 'Pending', '2024-03-20'),
(2, 'Prepare marketing plan', 'Completed', '2024-03-10'),
(2, 'Coordinate with clients', 'In Progress', '2024-03-25'),
(3, 'Update HR policies', 'Completed', '2024-03-05'),
(3, 'Conduct interviews', 'Pending', '2024-03-12'),
(3, 'Manage employee onboarding', 'In Progress', '2024-03-20'),
(4, 'Review sales targets', 'Completed', '2024-03-07'),
(5, 'Setup new servers', 'Pending', '2024-03-18'),
(5, 'Monitor network', 'In Progress', '2024-03-22'),
(5, 'Resolve IT issues', 'Pending', '2024-03-30'),
(5, 'Upgrade software', 'Completed', '2024-03-25');
