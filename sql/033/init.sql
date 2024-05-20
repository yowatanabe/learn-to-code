-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS Categories;

CREATE TABLE
    Products (
        ProductID INT,
        ProductName VARCHAR(50),
        CategoryID INT,
        Price INT
    );

CREATE TABLE
    Categories (CategoryID INT, CategoryName VARCHAR(50));

-- INSERT DATA
INSERT INTO
    Products (ProductID, ProductName, CategoryID, Price)
VALUES
    (1, 'Laptop', 1, 1000),
    (2, 'Mouse', 2, 50),
    (3, 'Keyboard', 2, 80),
    (4, 'Monitor', 3, 300),
    (5, 'Desk', 3, 150);

INSERT INTO
    Categories (CategoryID, CategoryName)
VALUES
    (1, 'Electronics'),
    (2, 'Accessories'),
    (3, 'Furniture');
