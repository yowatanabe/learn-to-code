-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    CuisineType VARCHAR(50),
    Rating DECIMAL(3, 1)
  );

CREATE TABLE
  Reservations (
    ReservationID INT PRIMARY KEY,
    RestaurantID INT,
    ReservationDate DATE,
    NumberOfGuests INT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants (RestaurantID)
  );

CREATE TABLE
  Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    PhoneNumber VARCHAR(15)
  );

-- 初期データ挿入
INSERT INTO
  Restaurants (RestaurantID, RestaurantName, CuisineType, Rating)
VALUES
  (1, 'Bella Italia', 'Italian', 4.5),
  (2, 'Sushi World', 'Japanese', 4.8),
  (3, 'Tacos Fiesta', 'Mexican', 4.2),
  (4, 'Curry Palace', 'Indian', 4.3);

INSERT INTO
  Reservations (
    ReservationID,
    RestaurantID,
    ReservationDate,
    NumberOfGuests
  )
VALUES
  (101, 1, '2024-10-01', 5),
  (102, 2, '2024-10-02', 2),
  (103, 3, '2024-10-02', 4),
  (104, 1, '2024-10-03', 3),
  (105, 4, '2024-10-04', 6);

INSERT INTO
  Customers (CustomerID, CustomerName, PhoneNumber)
VALUES
  (1, 'John Doe', '555-1234'),
  (2, 'Jane Smith', '555-5678'),
  (3, 'Mike Johnson', '555-8765');
