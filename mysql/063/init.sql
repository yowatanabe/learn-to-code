-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Teams (TeamID INT PRIMARY KEY, TeamName VARCHAR(100));

CREATE TABLE
  Players (
    PlayerID INT PRIMARY KEY,
    TeamID INT,
    PlayerName VARCHAR(100),
    Position VARCHAR(50),
    FOREIGN KEY (TeamID) REFERENCES Teams (TeamID)
  );

-- 初期データ挿入
INSERT INTO
  Teams (TeamID, TeamName)
VALUES
  (1, 'Eagles'),
  (2, 'Tigers'),
  (3, 'Lions');

INSERT INTO
  Players (PlayerID, TeamID, PlayerName, Position)
VALUES
  (1, 1, 'Alice', 'Forward'),
  (2, 1, 'Bob', 'Goalkeeper'),
  (3, 2, 'Charlie', 'Forward'),
  (4, 3, 'David', 'Midfielder'),
  (5, 3, 'Eve', 'Defender');
