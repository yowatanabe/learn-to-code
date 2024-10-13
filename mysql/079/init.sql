-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Members (MemberID INT PRIMARY KEY, MemberName VARCHAR(100));

CREATE TABLE
  Sessions (
    SessionID INT PRIMARY KEY,
    MemberID INT,
    SessionDate DATE,
    Duration INT,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (MemberID) REFERENCES Members (MemberID)
  );

-- 初期データ挿入
INSERT INTO
  Members (MemberID, MemberName)
VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie');

INSERT INTO
  Sessions (SessionID, MemberID, SessionDate, Duration, Cost)
VALUES
  (101, 1, '2024-10-01', 60, 1500),
  (102, 2, '2024-10-02', 90, 2000),
  (103, 3, '2024-10-03', 45, 1200),
  (104, 1, '2024-10-04', 60, 1500),
  (105, 2, '2024-10-05', 60, 1500);
