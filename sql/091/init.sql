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
        ProductName VARCHAR(50),
        Stock INT
    );

CREATE TABLE
    Sales (
        SaleID INT PRIMARY KEY AUTO_INCREMENT,
        ProductID INT,
        Quantity INT,
        SaleDate DATE,
        FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
    );

-- INSERT DATA
INSERT INTO
    Products (ProductID, ProductName, Stock)
VALUES
    (1, 'Laptop', 10),
    (2, 'Mouse', 50),
    (3, 'Keyboard', 30);

INSERT INTO
    Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
    (1, 1, 2, '2024-07-01'),
    (2, 2, 5, '2024-07-05');
