-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
-- Customersテーブルの作成
CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL
  );

-- Roomsテーブルの作成
CREATE TABLE
  Rooms (
    RoomID INT PRIMARY KEY,
    RoomType VARCHAR(50) NOT NULL,
    PricePerNight DECIMAL(10, 2) NOT NULL
  );

-- Bookingsテーブルの作成
CREATE TABLE
  Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    RoomID INT,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Rooms (RoomID)
  );

-- 初期データの挿入
-- Customersテーブルにデータを挿入
INSERT INTO
  Customers (CustomerID, CustomerName, ContactNumber)
VALUES
  (1, 'Alice Johnson', '123-456-7890'),
  (2, 'Bob Smith', '987-654-3210'),
  (3, 'Charlie Brown', '555-666-7777');

-- Roomsテーブルにデータを挿入
INSERT INTO
  Rooms (RoomID, RoomType, PricePerNight)
VALUES
  (101, 'Single', 100),
  (102, 'Double', 150),
  (103, 'Suite', 300);

-- Bookingsテーブルにデータを挿入
INSERT INTO
  Bookings (CustomerID, RoomID, CheckInDate, CheckOutDate)
VALUES
  (1, 101, '2024-09-01', '2024-09-02'),
  (2, 103, '2024-09-03', '2024-09-04'),
  (3, 102, '2024-09-05', '2024-09-06');
