-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS movie_sessions;

CREATE TABLE
    IF NOT EXISTS movie_sessions (
        session_id INT AUTO_INCREMENT PRIMARY KEY,
        movie_title VARCHAR(255) NOT NULL,
        revenue DECIMAL(10, 2) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    movie_sessions (movie_title, revenue)
VALUES
    ('Galaxy Quest', 1200.00),
    ('Galaxy Quest', 850.00),
    ('Star Bound', 950.00),
    ('Star Bound', 1100.00),
    ('Journey Unknown', 500.00),
    ('Journey Unknown', 450.00),
    ('Cosmic Adventure', 1300.00);
