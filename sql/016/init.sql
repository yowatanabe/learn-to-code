-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS movies;

CREATE TABLE
    IF NOT EXISTS movies (
        movie_id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        rating FLOAT NOT NULL
    );

-- INSERT DATA
INSERT INTO
    movies (title, rating)
VALUES
    ('movie1', 8.9),
    ('movie2', 8.9),
    ('movie3', 9.0),
    ('movie4', 9.2),
    ('movie5', 8.9),
    ('movie6', 9.3),
    ('movie7', 8.9),
    ('movie8', 8.8),
    ('movie9', 8.8);
