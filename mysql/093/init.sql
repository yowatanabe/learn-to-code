-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Hotels (
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(100),
    Location VARCHAR(100),
    Rating DECIMAL(3, 1)
  );

CREATE TABLE
  Bookings (
    BookingID INT PRIMARY KEY,
    HotelID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    NumberOfGuests INT,
    CustomerID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotels (HotelID)
  );

CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
  );

-- 初期データ挿入
INSERT INTO
  Hotels (HotelID, HotelName, Location, Rating)
VALUES
  (1, 'Grand Hotel', 'New York', 5.0),
  (2, 'City Inn', 'Los Angeles', 4.3),
  (3, 'Beach Resort', 'Miami', 4.8),
  (4, 'Mountain Lodge', 'Denver', 4.5);

INSERT INTO
  Bookings (
    BookingID,
    HotelID,
    CheckInDate,
    CheckOutDate,
    NumberOfGuests,
    CustomerID
  )
VALUES
  (101, 1, '2024-11-01', '2024-11-05', 2, 1),
  (102, 2, '2024-11-03', '2024-11-06', 3, 2),
  (103, 3, '2024-11-07', '2024-11-10', 4, 3),
  (104, 1, '2024-11-12', '2024-11-15', 1, 4),
  (105, 4, '2024-11-14', '2024-11-18', 5, 2);

INSERT INTO
  Customers (CustomerID, CustomerName)
VALUES
  (1, 'Sarah Jones'),
  (2, 'Michael Lee'),
  (3, 'Emma Brown'),
  (4, 'David Smith');
