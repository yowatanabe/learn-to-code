-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    total_salary_paid DECIMAL(10, 2) DEFAULT 0 -- 累積支給額
  );

CREATE TABLE
  salary_payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    payment_amount DECIMAL(10, 2), -- 支給額
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
  );

-- 初期データ挿入
INSERT INTO
  employees (employee_id, employee_name, total_salary_paid)
VALUES
  (1, 'Alice', 1000.00),
  (2, 'Bob', 1500.00),
  (3, 'Charlie', 2000.00);
