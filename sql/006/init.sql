-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS transactions;

CREATE TABLE
    IF NOT EXISTS transactions (
        transaction_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT NOT NULL,
        transaction_date DATE NOT NULL,
        amount DECIMAL(10, 2) NOT NULL,
        description VARCHAR(255)
    );

-- INSERT DATA
INSERT INTO
    transactions (
        customer_id,
        transaction_date,
        amount,
        description
    )
VALUES
    (101, '2023-09-01', 150.50, 'Book Purchase'),
    (102, '2023-09-01', 200.00, 'Electronics Purchase'),
    (103, '2023-08-30', 99.99, 'Grocery Shopping'),
    (104, '2023-09-01', 50.00, 'Monthly Subscription'),
    (105, '2023-09-02', 300.00,'Software Subscription');
