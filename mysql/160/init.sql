-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    hire_date DATE NOT NULL
);

CREATE TABLE skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    skill_name VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE employee_skills (
    employee_skill_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_id INT,                                  -- 外部キー
    skill_id INT,                                     -- 外部キー
    proficiency_level ENUM('Beginner', 'Intermediate', 'Expert') NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id), -- 外部キー制約
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)           -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO employees (name, department, hire_date) VALUES
('Alice', 'Engineering', '2021-01-15'),
('Bob', 'Design', '2020-03-20'),
('Charlie', 'Management', '2019-07-10'),
('Diana', 'Quality Assurance', '2022-05-01'),
('Eve', 'Data Science', '2018-11-30');

INSERT INTO skills (skill_name) VALUES
('Python'),
('SQL'),
('Cloud Computing'),
('Data Analysis'),
('Project Management');

INSERT INTO employee_skills (employee_id, skill_id, proficiency_level) VALUES
(1, 1, 'Expert'), -- Alice: Python
(1, 2, 'Intermediate'), -- Alice: SQL
(2, 2, 'Beginner'), -- Bob: SQL
(3, 5, 'Expert'), -- Charlie: Project Management
(4, 3, 'Intermediate'), -- Diana: Cloud Computing
(5, 4, 'Expert'), -- Eve: Data Analysis
(5, 1, 'Beginner'); -- Eve: Python
