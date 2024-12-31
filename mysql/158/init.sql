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

CREATE TABLE training_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_id INT,                          -- 外部キー
    training_name VARCHAR(100) NOT NULL,
    participation_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO employees (name, department, hire_date) VALUES
('Alice', 'Engineering', '2021-01-15'),
('Bob', 'Design', '2020-03-20'),
('Charlie', 'Management', '2019-07-10'),
('David', 'Quality Assurance', '2022-05-01'),
('Emma', 'Business', '2018-11-30'),
('Frank', 'HR', '2017-09-20'),
('Grace', 'Data Science', '2021-12-01'),
('Hannah', 'DevOps', '2019-04-12'),
('Ian', 'Development', '2023-08-15'),
('Jack', 'Operations', '2022-02-01');

INSERT INTO training_records (employee_id, training_name, participation_date) VALUES
(1, 'Leadership Workshop', '2023-11-01'),
(2, 'Leadership Workshop', '2023-11-01'),
(3, 'Project Management Training', '2023-11-15'),
(4, 'Agile Development', '2023-11-15'),
(5, 'Agile Development', '2023-12-01'),
(6, 'Time Management Seminar', '2023-12-05'),
(7, 'Data Analysis Training', '2023-12-10'),
(8, 'Data Analysis Training', '2023-12-10'),
(9, 'Software Architecture', '2023-12-20'),
(10, 'Software Architecture', '2023-12-20');
