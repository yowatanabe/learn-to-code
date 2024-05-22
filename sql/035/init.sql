-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Sales;

DROP TABLE IF EXISTS Products;

CREATE TABLE
    Sales (
        SaleID INT,
        ProductID INT,
        SaleDate DATE,
        Quantity INT,
        Price INT
    );

CREATE TABLE
    Products (ProductID INT, ProductName VARCHAR(50));

-- INSERT DATA
INSERT INTO
    Sales (SaleID, ProductID, SaleDate, Quantity, Price)
VALUES
    (1, 1, '2024-01-01', 10, 100),
    (2, 2, '2024-01-02', 5, 200),
    (3, 1, '2024-01-03', 2, 100),
    (4, 3, '2024-01-04', 7, 150),
    (5, 2, '2024-01-05', 1, 200);

INSERT INTO
    Products (ProductID, ProductName)
VALUES
    (1, 'Laptop'),
    (2, 'Smartphone'),
    (3, 'Tablet');
