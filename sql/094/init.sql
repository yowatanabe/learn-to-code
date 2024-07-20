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
        Price DECIMAL(10, 2),
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
    Products (ProductID, ProductName, Price, Stock)
VALUES
    (1, 'Laptop', 1000, 10),
    (2, 'Mouse', 20, 50),
    (3, 'Keyboard', 50, 30);

INSERT INTO
    Sales (ProductID, Quantity, SaleDate)
VALUES
    (1, 2, '2024-07-01'),
    (2, 5, '2024-07-05');
