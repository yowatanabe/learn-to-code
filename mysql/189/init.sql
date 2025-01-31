-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE business_trips (
    trip_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    destination VARCHAR(100) NOT NULL,      -- 出張先
    purpose VARCHAR(100) NOT NULL,          -- 目的
    start_date DATE NOT NULL,               -- 開始日
    end_date DATE NOT NULL,                 -- 終了日
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE trip_participants (
    participant_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    trip_id INT,                                  -- 外部キー
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (trip_id) REFERENCES business_trips(trip_id) ON DELETE CASCADE
);

-- 初期データ挿入
INSERT INTO business_trips (destination, purpose, start_date, end_date) VALUES
('San Francisco', 'Tech Conference', '2024-02-10', '2024-02-15'),
('New York', 'Client Meeting', '2024-03-05', '2024-03-07'),
('London', 'Training Program', '2024-04-01', '2024-04-10');

INSERT INTO trip_participants (trip_id, employee_name, department, role) VALUES
(1, 'Alice', 'Engineering', 'Speaker'),
(1, 'Bob', 'Marketing', 'Coordinator'),
(2, 'Charlie', 'Sales', 'Negotiator'),
(2, 'Diana', 'Client Success', 'Manager'),
(3, 'Eve', 'HR', 'Trainer');
