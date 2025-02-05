-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    project_name VARCHAR(100) NOT NULL,
    manager VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    project_id INT,                         -- 外部キー
    task_name VARCHAR(200) NOT NULL,
    assignee VARCHAR(100) NOT NULL,
    status ENUM('Pending', 'In Progress', 'Completed') NOT NULL,
    due_date DATE NOT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- 初期データ挿入
INSERT INTO projects (project_name, manager, start_date, end_date) VALUES
('Website Redesign', 'Alice', '2024-02-01', '2024-05-01'),
('Mobile App Development', 'Bob', '2024-03-01', '2024-06-30'),
('Cloud Migration', 'Charlie', '2024-04-01', '2024-07-31');

INSERT INTO tasks (project_id, task_name, assignee, status, due_date) VALUES
(1, 'Design new UI', 'Eve', 'In Progress', '2024-03-15'),
(1, 'Refactor CSS', 'Frank', 'Pending', '2024-04-01'),
(1, 'Test responsive layout', 'Grace', 'Completed', '2024-04-10'),
(2, 'Develop authentication module', 'Heidi', 'In Progress', '2024-04-15'),
(2, 'Implement payment gateway', 'Ivan', 'Pending', '2024-05-10'),
(2, 'Fix security vulnerabilities', 'Jack', 'Completed', '2024-06-01'),
(2, 'Optimize database queries', 'Karen', 'In Progress', '2024-06-15'),
(3, 'Migrate database to cloud', 'Leo', 'Pending', '2024-05-20');
