-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Sales;

CREATE TABLE
    Sales (
        SaleID INT,
        ProductName VARCHAR(50),
        Quantity INT,
        UnitPrice INT,
        SaleDate DATE
    );

-- INSERT DATA
INSERT INTO
    Sales (
        SaleID,
        ProductName,
        Quantity,
        UnitPrice,
        SaleDate
    )
VALUES
    (1, 'Laptop', 3, 1000, '2024-01-15'),
    (2, 'Smartphone', 5, 800, '2024-02-10'),
    (3, 'Tablet', 2, 600, '2024-03-05'),
    (4, 'Monitor', 7, 200, '2024-01-25'),
    (5, 'Headphones', 10, 100, '2024-02-20');
