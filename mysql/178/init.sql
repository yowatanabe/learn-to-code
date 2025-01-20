-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_id INT,                              -- 外部キー
    attendance_date DATE NOT NULL,               -- 出勤日
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 初期データ挿入
INSERT INTO employees (employee_name, department, hire_date) VALUES
('Alice', 'Engineering', '2020-01-15'),
('Bob', 'Marketing', '2019-07-10'),
('Charlie', 'HR', '2021-03-01'),
('Diana', 'Sales', '2018-11-25'),
('Eve', 'IT Support', '2022-05-10');

INSERT INTO attendance (employee_id, attendance_date)
SELECT
    FLOOR(RAND()*5) + 1,                          -- employee_id: 1～5
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*60) DAY) -- 過去60日間のランダム日付
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2;
