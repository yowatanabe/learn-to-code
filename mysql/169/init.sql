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
    hire_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE shifts (
    shift_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    employee_id INT,                         -- 外部キー
    shift_date DATE NOT NULL,
    shift_start TIME NOT NULL,
    shift_end TIME NOT NULL
    -- FOREIGN KEY (employee_id) REFERENCES employees(employee_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO employees (name, department, hire_date) VALUES
('Alice', 'Engineering', '2021-01-15'),
('Bob', 'Design', '2020-03-20'),
('Charlie', 'Management', '2019-07-10'),
('Diana', 'Quality Assurance', '2022-05-01'),
('Eve', 'Business', '2018-11-30');

INSERT INTO shifts (employee_id, shift_date, shift_start, shift_end)
SELECT
    FLOOR(RAND()*5) + 1,                     -- employee_id: 1～5
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*90) DAY), -- 過去90日間のランダム日付
    ADDTIME('08:00:00', SEC_TO_TIME(FLOOR(RAND()*120)*60)), -- shift_start: 08:00～10:00
    ADDTIME('16:00:00', SEC_TO_TIME(FLOOR(RAND()*120)*60))  -- shift_end: 16:00～18:00
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
