-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS sales;

CREATE TABLE
    IF NOT EXISTS sales (
        sale_id INT AUTO_INCREMENT PRIMARY KEY,
        product_name VARCHAR(255) NOT NULL,
        category VARCHAR(100) NOT NULL,
        amount DECIMAL(10, 2) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    sales (product_name, category, amount)
VALUES
    ('Laptop', 'Electronics', 1200.00),
    ('Smartphone', 'Electronics', 800.00),
    ('Headphones', 'Electronics', 150.00),
    ('Blender', 'Home Appliances', 300.00),
    ('Microwave', 'Home Appliances', 400.00),
    ('Camera', 'Electronics', 500.00);
