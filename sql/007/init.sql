-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS transactions;

DROP TABLE IF EXISTS orders;

CREATE TABLE
    IF NOT EXISTS customers (
        customer_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS orders (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT NOT NULL,
        order_date DATE NOT NULL,
        amount DECIMAL(10, 2) NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
    );

-- INSERT DATA
INSERT INTO
    customers (name, email)
VALUES
    ('customers1', 'customers1@example.com'),
    ('customers2', 'customers2@example.com');

INSERT INTO
    orders (customer_id, order_date, amount)
VALUES
    (1, '2024-01-01', 100.00),
    (1, '2024-01-12', 200.00),
    (2, '2024-01-02', 150.00),
    (2, '2024-01-15', 250.00);
