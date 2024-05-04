-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS restaurants;

CREATE TABLE
    IF NOT EXISTS restaurants (
        restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        rating FLOAT NOT NULL
    );

-- INSERT DATA
INSERT INTO
    restaurants (name, rating)
VALUES
    ('レストランA', 4.8),
    ('レストランB', 4.5),
    ('レストランC', 4.6),
    ('レストランD', 4.7),
    ('レストランE', 4.3),
    ('レストランF', 4.9),
    ('レストランG', 4.2),
    ('レストランH', 4.1),
    ('レストランI', 4.0),
    ('レストランJ', 4.7),
    ('レストランK', 4.4),
    ('レストランL', 4.5);
