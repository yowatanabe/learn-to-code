-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS transactions;

CREATE TABLE
    IF NOT EXISTS transactions (
        transaction_id INT AUTO_INCREMENT PRIMARY KEY,
        transaction_time DATETIME NOT NULL,
        amount DECIMAL(10, 2) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    transactions (transaction_time, amount)
VALUES
    ('2024-04-26 08:30:00', 150.50),
    ('2024-04-26 10:20:00', 200.00),
    ('2024-04-26 14:15:00', 500.00),
    ('2024-04-26 16:45:00', 2200.00),
    ('2024-04-26 19:00:00', 3300.00),
    ('2024-04-26 20:15:00', 600.00),
    ('2024-04-26 21:30:00', 1200.00),
    ('2024-04-26 22:45:00', 2400.00);
