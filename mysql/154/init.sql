-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE,
    location VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE attendees (
    attendee_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    attendee_name VARCHAR(100),
    registration_date DATE
    -- FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- 初期データ挿入
INSERT INTO events (event_name, event_date, location) VALUES
('Tech Conference 2024', '2024-01-15', 'Tokyo'),
('AI Summit', '2024-02-20', 'Osaka'),
('DevOps Workshop', '2024-02-05', 'Kyoto'),
('Cloud Expo', '2024-01-25', 'Nagoya'),
('Cybersecurity Forum', '2024-02-10', 'Tokyo'),
('Data Science Meetup', '2024-01-20', 'Fukuoka'),
('Startup Pitch Day', '2024-01-30', 'Sapporo'),
('Gaming Hackathon', '2024-02-18', 'Hiroshima'),
('UX/UI Design Bootcamp', '2024-02-12', 'Kobe'),
('Blockchain Seminar', '2024-01-28', 'Nagano');

INSERT INTO attendees (event_id, attendee_name, registration_date)
SELECT
    FLOOR(RAND()*10) + 1,                   -- event_id: 1～10
    CONCAT('Attendee_', FLOOR(RAND()*1000)), -- attendee_name
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*90) DAY) -- 過去90日間のランダム日付
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
