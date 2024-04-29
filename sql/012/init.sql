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
        rating FLOAT NOT NULL,
        cuisine VARCHAR(100) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    restaurants (name, rating, cuisine)
VALUES
    ('Ocean View', 4.5, 'Seafood'),
    ('Mountain Delight', 3.9, 'Italian'),
    ('City Lights', 4.2, 'French'),
    ('Sunset Grill', 4.8, 'American'),
    ('Garden Bistro', 3.5, 'Vegetarian');
