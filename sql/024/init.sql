-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS room_reservations;

CREATE TABLE
    IF NOT EXISTS room_reservations (
        reservation_id INT AUTO_INCREMENT PRIMARY KEY,
        room_type VARCHAR(255) NOT NULL,
        reservation_date DATE NOT NULL
    );

-- INSERT DATA
INSERT INTO
    room_reservations (room_type, reservation_date)
VALUES
    ('Standard', '2024-05-01'),
    ('Standard', '2024-05-02'),
    ('Deluxe', '2024-05-02'),
    ('Suite', '2024-05-03'),
    ('Standard', '2024-05-03'),
    ('Deluxe', '2024-05-04'),
    ('Standard', '2024-05-04'),
    ('Suite', '2024-05-04'),
    ('Standard', '2024-05-05'),
    ('Standard', '2024-05-05'),
    ('Standard', '2024-05-06'),
    ('Deluxe', '2024-05-06'),
    ('Deluxe', '2024-05-07'),
    ('Standard', '2024-05-07'),
    ('Standard', '2024-05-08'),
    ('Suite', '2024-05-08'),
    ('Suite', '2024-05-09'),
    ('Standard', '2024-05-09'),
    ('Deluxe', '2024-05-10'),
    ('Standard', '2024-05-10');
