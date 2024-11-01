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
    Location VARCHAR(100)
  );

CREATE TABLE
  Participants (
    ParticipantID INT PRIMARY KEY,
    EventID INT,
    ParticipantName VARCHAR(100),
    FOREIGN KEY (EventID) REFERENCES Events (EventID)
  );

-- 初期データ挿入
INSERT INTO
  Events (EventID, EventName, Location)
VALUES
  (1, 'Tech Summit', 'Tokyo'),
  (2, 'AI Workshop', 'Osaka');

INSERT INTO
  Participants (ParticipantID, EventID, ParticipantName)
VALUES
  (1, 1, 'John Doe'),
  (2, 1, 'Alice Smith');
