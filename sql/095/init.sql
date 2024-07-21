-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Books;

DROP TABLE IF EXISTS Sales;

CREATE TABLE
    Books (
        BookID INT PRIMARY KEY,
        Title VARCHAR(100),
        Author VARCHAR(100),
        Stock INT
    );

CREATE TABLE
    Sales (
        SaleID INT PRIMARY KEY AUTO_INCREMENT,
        BookID INT,
        Quantity INT,
        SaleDate DATE,
        FOREIGN KEY (BookID) REFERENCES Books (BookID)
    );

-- INSERT DATA
INSERT INTO
    Books (BookID, Title, Author, Stock)
VALUES
    (1, 'To Kill a Mockingbird', 'Harper Lee', 10),
    (2, '1984', 'George Orwell', 8),
    (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 5);

INSERT INTO
    Sales (BookID, Quantity, SaleDate)
VALUES
    (1, 2, '2024-07-01'),
    (2, 1, '2024-07-05');
