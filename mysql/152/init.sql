-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    joined_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    work_date DATE,
    clock_in TIME,
    clock_out TIME
    -- FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 初期データ挿入
INSERT INTO employees (employee_name, department) VALUES
('Alice', 'Engineering'),
('Bob', 'Engineering'),
('Charlie', 'HR'),
('David', 'HR'),
('Emma', 'Finance'),
('Frank', 'Finance'),
('Grace', 'Sales'),
('Hannah', 'Sales'),
('Ian', 'Support'),
('Jack', 'Support');

INSERT INTO attendance (employee_id, work_date, clock_in, clock_out)
SELECT
    FLOOR(RAND()*10) + 1,                     -- employee_id: 1～10
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*60) DAY), -- 過去60日間のランダム日付
    TIME(DATE_ADD('2000-01-01 08:00:00', INTERVAL FLOOR(RAND()*60) MINUTE)), -- clock_in: 8:00～9:00
    TIME(DATE_ADD('2000-01-01 17:00:00', INTERVAL FLOOR(RAND()*60) MINUTE))  -- clock_out: 17:00～18:00
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
