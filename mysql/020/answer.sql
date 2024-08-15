-- データベースの作成
CREATE DATABASE AirlineDB;

-- データベースの選択
USE AirlineDB;

-- Flightsテーブルの作成
CREATE TABLE
  Flights (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    FlightNumber VARCHAR(10) NOT NULL,
    DepartureDate DATE NOT NULL,
    DepartureTime TIME NOT NULL,
    Duration TIME NOT NULL,
    TicketPrice FLOAT (7, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Flights (
    FlightNumber,
    DepartureDate,
    DepartureTime,
    Duration,
    TicketPrice
  )
VALUES
  (
    'UA1001',
    '2024-08-16',
    '09:30:00',
    '02:45:00',
    250.50
  ),
  (
    'DL2020',
    '2024-08-17',
    '14:15:00',
    '03:20:00',
    320.75
  ),
  (
    'AA3033',
    '2024-08-18',
    '18:00:00',
    '04:00:00',
    410.00
  );
