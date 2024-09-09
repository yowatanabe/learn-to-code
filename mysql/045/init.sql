-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Flights (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(10),
    DepartureCity VARCHAR(100),
    ArrivalCity VARCHAR(100),
    DepartureDate DATE,
    ArrivalDate DATE
  );

-- 初期データの挿入
INSERT INTO
  Flights (
    FlightID,
    FlightNumber,
    DepartureCity,
    ArrivalCity,
    DepartureDate,
    ArrivalDate
  )
VALUES
  (
    1,
    'AA123',
    'New York',
    'Los Angeles',
    '2024-09-01',
    '2024-09-01'
  ),
  (
    2,
    'AA124',
    'New York',
    'Chicago',
    '2024-09-02',
    '2024-09-02'
  ),
  (
    3,
    'BA201',
    'London',
    'New York',
    '2024-09-03',
    '2024-09-03'
  ),
  (
    4,
    'JL456',
    'Tokyo',
    'New York',
    '2024-09-04',
    '2024-09-04'
  ),
  (
    5,
    'SQ789',
    'Singapore',
    'Tokyo',
    '2024-09-05',
    '2024-09-05'
  );
