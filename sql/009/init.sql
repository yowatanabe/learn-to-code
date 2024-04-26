-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS products;

CREATE TABLE
    IF NOT EXISTS products (
        product_id INT AUTO_INCREMENT PRIMARY KEY,
        product_name VARCHAR(255) NOT NULL,
        category VARCHAR(100) NOT NULL,
        units_sold INT NOT NULL
    );

-- INSERT DATA
INSERT INTO
    products (product_name, category, units_sold)
VALUES
    ('Smartphone Model X', 'Electronics', 250),
    ('Laptop Model Y', 'Electronics', 300),
    ('Bluetooth Speaker', 'Electronics', 150),
    ('Organic Green Tea', 'Beverages', 220),
    ('Coffee Beans', 'Beverages', 180),
    ('Green Tea', 'Beverages', 210);
