-- データベースの作成
CREATE DATABASE SchedulingDB;

-- データベースの選択
USE SchedulingDB;

-- Appointmentsテーブルの作成
CREATE TABLE
  Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    ClientName VARCHAR(100) NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Duration TIME NOT NULL,
    Fee DECIMAL(10, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Appointments (
    ClientName,
    AppointmentDate,
    AppointmentTime,
    Duration,
    Fee
  )
VALUES
  (
    'Alice',
    '2024-08-13',
    '09:30:00',
    '01:00',
    100.00
  ),
  ('Bob', '2024-08-14', '14:00:00', '00:30', 50.00),
  (
    'Charlie',
    '2024-08-15',
    '11:00:00',
    '02:00',
    200.00
  );
