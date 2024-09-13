-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    age INT
  );

-- 初期データの挿入
INSERT INTO
  users (username, email, age)
VALUES
  ('alice', 'alice@example.com', 30),
  ('bob', 'bob@example.com', 25),
  ('charlie', 'charlie@example.com', 35),
  ('david', 'david@example.com', 28),
  ('eve', 'eve@example.com', 22);
