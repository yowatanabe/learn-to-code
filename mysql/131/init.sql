-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  department_summary (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    employee_count INT DEFAULT 0
  );

CREATE TABLE
  employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department_summary (department_id)
  );

-- 初期データ挿入
INSERT INTO
  department_summary (department_id, department_name, employee_count)
VALUES
  (1, 'Sales', 0),
  (2, 'Engineering', 0),
  (3, 'HR', 0);
