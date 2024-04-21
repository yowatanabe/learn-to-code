-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS customers;

CREATE TABLE
    IF NOT EXISTS customers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        age INT,
        city VARCHAR(255)
    );

-- INSERT DATA
INSERT INTO
    customers (name, email, age, city)
VALUES
    ('顧客1', 'customers1@example.com', 35, '東京都'),
    ('顧客2', 'customers2@example.com', 28, '大阪府'),
    ('顧客3', 'customers3@example.com', 42, '東京都'),
    ('顧客4', 'customers4@example.com', 29, '福岡県'),
    ('顧客5', 'customers5@example.com', 29, '東京都'),
    ('顧客6', 'customers6@example.com', 27, '北海道'),
    ('顧客7', 'customers7@example.com', 31, '東京都'),
    ('顧客8', 'customers8@example.com', 36, '神奈川県'),
    ('顧客9', 'customers9@example.com', 25, '愛知県'),
    ('顧客10', 'customers10@example.com', 45, '東京都');
