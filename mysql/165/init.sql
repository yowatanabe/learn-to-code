-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE event_participants (
    participant_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    event_id INT,                                  -- 外部キー
    participant_name VARCHAR(100) NOT NULL,
    registered_at DATETIME DEFAULT CURRENT_TIMESTAMP
    -- FOREIGN KEY (event_id) REFERENCES events(event_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO events (event_name, event_date) VALUES
('Tech Conference 2023', '2023-12-10'),
('Annual Gala', '2023-12-15'),
('Workshop on AI', '2023-12-20'),
('Networking Event', '2023-12-25'),
('End of Year Party', '2023-12-31');

INSERT INTO event_participants (event_id, participant_name, registered_at)
SELECT
    FLOOR(RAND()*5) + 1,                          -- event_id: 1～5
    CONCAT('Participant_', FLOOR(RAND()*500)),   -- participant_name
    DATE_ADD(NOW(), INTERVAL -FLOOR(RAND()*30) DAY) -- 過去30日間のランダム日時
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
