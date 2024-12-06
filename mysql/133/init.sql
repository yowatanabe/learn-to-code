-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE
  );

CREATE TABLE
  member_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    action VARCHAR(20), -- 'INSERT' or 'UPDATE'
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    details TEXT
  );

-- 初期データ挿入
INSERT INTO
  members (name, email, registration_date)
VALUES
  ('Alice', 'alice@example.com', '2024-12-01'),
  ('Bob', 'bob@example.com', '2024-12-15');
