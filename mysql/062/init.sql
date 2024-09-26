-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATE
  );

CREATE TABLE
  Participants (
    ParticipantID INT PRIMARY KEY,
    EventID INT,
    ParticipantName VARCHAR(100),
    RegistrationDate DATE,
    FOREIGN KEY (EventID) REFERENCES Events (EventID)
  );

-- 初期データ挿入
INSERT INTO
  Events (EventID, EventName, EventDate)
VALUES
  (1, 'Hackathon', '2024-10-01'),
  (2, 'Workshop', '2024-10-10'),
  (3, 'Meetup', '2024-10-15');

INSERT INTO
  Participants (
    ParticipantID,
    EventID,
    ParticipantName,
    RegistrationDate
  )
VALUES
  (1, 1, 'Alice', '2024-09-25'),
  (2, 1, 'Bob', '2024-09-26'),
  (3, 2, 'Charlie', '2024-09-27'),
  (4, 2, 'David', '2024-09-28'),
  (5, 3, 'Eve', '2024-09-29');
