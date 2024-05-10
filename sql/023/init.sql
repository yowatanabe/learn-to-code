-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS sales_data;

CREATE TABLE
    IF NOT EXISTS sales_data (
        sale_id INT AUTO_INCREMENT PRIMARY KEY,
        product_name VARCHAR(255) NOT NULL,
        sale_date DATE NOT NULL,
        amount DECIMAL(10, 2) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    sales_data (product_name, sale_date, amount)
VALUES
    ('Coffee', '2024-05-11', 200.00),
    ('Coffee', '2024-05-12', 180.00),
    ('Tea', '2024-05-11', 100.00),
    ('Coffee', '2024-05-13', 220.00),
    ('Pastry', '2024-05-11', 150.00),
    ('Pastry', '2024-05-12', 300.00),
    ('Tea', '2024-05-12', 120.00),
    ('Pastry', '2024-05-13', 80.00);
