-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Reservations (
    ReservationID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ReservationDate DATE,
    PartySize INT
  );

-- 初期データの挿入
INSERT INTO
  Reservations (
    ReservationID,
    CustomerName,
    ReservationDate,
    PartySize
  )
VALUES
  (1, 'Alice', '2024-09-09', 4),
  (2, 'Bob', '2024-09-10', 2),
  (3, 'Charlie', '2024-09-11', 6),
  (4, 'Alice', '2024-09-12', 3),
  (5, 'David', '2024-09-13', 5);
