-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    work_date DATE,
    work_start TIME,
    work_end TIME
  );

CREATE TABLE
  monthly_work_summary (
    summary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    work_year INT,
    work_month INT,
    total_work_hours DECIMAL(10, 2) DEFAULT 0
  );

-- 初期データ挿入
INSERT INTO
  attendance (employee_id, work_date, work_start, work_end)
VALUES
  (1, '2024-12-01', '09:00:00', '18:00:00'),
  (2, '2024-12-01', '10:00:00', '19:00:00');

INSERT INTO
  monthly_work_summary (
    employee_id,
    work_year,
    work_month,
    total_work_hours
  )
VALUES
  (1, 2024, 12, 9.00),
  (2, 2024, 12, 8.00);
