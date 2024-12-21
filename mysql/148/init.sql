-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    member_name VARCHAR(100),
    joined_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    membership_level VARCHAR(50) -- Basic, Premiumなど
);

CREATE TABLE workouts (
    workout_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    activity_type VARCHAR(50),       -- 例: Running, Cycling, WeightLifting 等
    burned_calories INT,             -- 消費カロリー
    workout_date DATETIME            -- ワークアウト実施日時
    -- 故意にINDEXを付与しない
    -- FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- 初期データ挿入
INSERT INTO members (member_name, membership_level) VALUES
('Alice', 'Premium'),
('Bob', 'Basic'),
('Charlie', 'Premium'),
('David', 'Basic'),
('Eve', 'Premium'),
('Frank', 'Basic');

INSERT INTO workouts (member_id, activity_type, burned_calories, workout_date)
SELECT
    FLOOR(RAND()*6) + 1,               -- member_id: 1〜6
    ELT(FLOOR(RAND()*3)+1, 'Running', 'Cycling', 'WeightLifting'),
    FLOOR(RAND()*400) + 100,           -- burned_calories: 100〜500
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*60) DAY) -- 60日前までのランダム日付
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
