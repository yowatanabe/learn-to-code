-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Products;

CREATE TABLE
    Products (
        ProductID INT,
        ProductName VARCHAR(100),
        Category VARCHAR(50)
    );

-- INSERT DATA
INSERT INTO
    Products (ProductID, ProductName, Category)
VALUES
    (1, 'Apple iPhone 13', 'Electronics'),
    (2, 'Samsung Galaxy S21', 'Electronics'),
    (3, 'Sony WH-1000XM4', 'Accessories'),
    (4, 'Dell XPS 13', 'Computers'),
    (5, 'HP Spectre x360', 'Computers');
