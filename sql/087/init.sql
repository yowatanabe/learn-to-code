-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS Sales;

CREATE TABLE
    Products (
        ProductID INT PRIMARY KEY,
        ProductName VARCHAR(50)
    );

CREATE TABLE
    Sales (
        SaleID INT PRIMARY KEY,
        ProductID INT,
        SaleDate DATE,
        Amount DECIMAL(10, 2),
        FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
    );

-- INSERT DATA
INSERT INTO
    Products (ProductID, ProductName)
VALUES
    (1, 'Laptop'),
    (2, 'Mouse'),
    (3, 'Keyboard');

INSERT INTO
    Sales (SaleID, ProductID, SaleDate, Amount)
VALUES
    (1, 1, '2024-07-01', 500),
    (2, 2, '2024-07-05', 300),
    (3, 1, '2024-08-01', 700),
    (4, 3, '2024-08-10', 200),
    (5, 2, '2024-09-01', 450);
