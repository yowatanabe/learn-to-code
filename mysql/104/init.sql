-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Movies (
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(100),
    AvailableSeats INT
  );

CREATE TABLE
  Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT,
    SeatsBooked INT,
    BookingDate DATE,
    FOREIGN KEY (MovieID) REFERENCES Movies (MovieID)
  );

-- 初期データ挿入
INSERT INTO
  Movies (MovieID, MovieName, AvailableSeats)
VALUES
  (1, 'Inception', 5),
  (2, 'Interstellar', 8),
  (3, 'The Dark Knight', 10);
