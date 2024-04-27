-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS users;

CREATE TABLE
    IF NOT EXISTS users (
        user_id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(255) NOT NULL,
        last_name VARCHAR(255) NOT NULL,
        birthdate DATE NOT NULL
    );

-- INSERT DATA
INSERT INTO
    users (first_name, last_name, birthdate)
VALUES
    ('John', 'Doe', '1992-09-15'),
    ('Jane', 'Smith', '1985-12-22'),
    ('Alice', 'Johnson', '1993-09-05'),
    ('Michael', 'Williams', '1991-07-18'),
    ('Maria', 'Garcia', '1994-09-30'),
    ('James', 'Brown', '1980-03-14');
