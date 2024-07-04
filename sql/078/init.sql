-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Categories;

DROP TABLE IF EXISTS Products;

CREATE TABLE
    Categories (
        CategoryID INT PRIMARY KEY,
        CategoryName VARCHAR(50)
    );

CREATE TABLE
    Products (
        ProductID INT PRIMARY KEY,
        ProductName VARCHAR(50),
        CategoryID INT,
        Price DECIMAL(10, 2),
        FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
    );

-- INSERT DATA
INSERT INTO
    Categories (CategoryID, CategoryName)
VALUES
    (1, 'Electronics'),
    (2, 'Accessories'),
    (3, 'Furniture');

INSERT INTO
    Products (ProductID, ProductName, CategoryID, Price)
VALUES
    (1, 'Laptop', 1, 1000),
    (2, 'Mouse', 2, 20),
    (3, 'Keyboard', 2, 50),
    (4, 'Monitor', 1, 300),
    (5, 'Desk', 3, 150);
