-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
  );

CREATE TABLE
  employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments (dept_id)
  );

-- 初期データ挿入
INSERT INTO
  departments (dept_id, dept_name)
VALUES
  (1, '営業部'),
  (2, '技術部'),
  (3, '人事部'),
  (4, 'マーケティング部');

INSERT INTO
  employees (emp_id, emp_name, salary, dept_id)
VALUES
  (101, '従業員A', 500000, 1),
  (102, '従業員B', 600000, 2),
  (103, '従業員C', 550000, 1),
  (104, '従業員D', 700000, 2),
  (105, '従業員E', 650000, 2),
  (106, '従業員F', 480000, 3),
  (107, '従業員G', 520000, 3),
  (108, '従業員H', 580000, 4),
  (109, '従業員I', 620000, 4),
  (110, '従業員J', 500000, 1);
