-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100),
    hire_date DATE NOT NULL
);

CREATE TABLE project_assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_id INT,                              -- 外部キー
    project_name VARCHAR(100) NOT NULL,
    assigned_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO employees (name, position, hire_date) VALUES
('Alice', 'Developer', '2020-01-15'),
('Bob', 'Designer', '2019-03-20'),
('Charlie', 'Project Manager', '2018-07-10'),
('David', 'QA Engineer', '2021-05-01'),
('Emma', 'Business Analyst', '2017-11-30'),
('Frank', 'HR Specialist', '2015-09-20'),
('Grace', 'Data Scientist', '2020-12-01'),
('Hannah', 'DevOps Engineer', '2019-04-12'),
('Ian', 'Frontend Developer', '2021-08-15'),
('Jack', 'Backend Developer', '2022-02-01');

INSERT INTO project_assignments (employee_id, project_name, assigned_date) VALUES
(1, 'Project Alpha', '2023-11-01'),
(2, 'Project Alpha', '2023-11-01'),
(3, 'Project Beta', '2023-11-15'),
(4, 'Project Beta', '2023-11-15'),
(5, 'Project Gamma', '2023-12-01'),
(6, 'Project Gamma', '2023-12-01'),
(7, 'Project Delta', '2023-12-10'),
(8, 'Project Delta', '2023-12-10'),
(9, 'Project Epsilon', '2023-12-20'),
(10, 'Project Epsilon', '2023-12-20');
