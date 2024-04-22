-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS orders;

CREATE TABLE
    IF NOT EXISTS orders (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        order_date DATE NOT NULL,
        amount DECIMAL(10, 2) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    orders (order_date, amount)
VALUES
    ('2023-01-15', 1500.00),
    ('2023-01-20', 2800.00),
    ('2023-02-10', 500.00),
    ('2023-02-21', 2200.00),
    ('2023-03-03', 3300.00),
    ('2023-03-18', 600.00),
    ('2023-03-29', 1200.00),
    ('2023-04-02', 2400.00),
    ('2023-04-15', 1300.00),
    ('2023-04-20', 700.00);
