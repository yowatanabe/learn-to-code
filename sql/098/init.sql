-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Authors;

DROP TABLE IF EXISTS Books;

DROP TABLE IF EXISTS Sales;

CREATE TABLE
    Authors (AuthorID INT PRIMARY KEY, AuthorName VARCHAR(100));

CREATE TABLE
    Books (
        BookID INT PRIMARY KEY,
        Title VARCHAR(100),
        AuthorID INT,
        FOREIGN KEY (AuthorID) REFERENCES Authors (AuthorID)
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
    Authors (AuthorID, AuthorName)
VALUES
    (1, 'J.K. Rowling'),
    (2, 'George Orwell'),
    (3, 'Mark Twain');

INSERT INTO
    Books (BookID, Title, AuthorID)
VALUES
    (1, 'Harry Potter', 1),
    (2, '1984', 2),
    (3, 'Animal Farm', 2),
    (4, 'Adventures of Huckleberry Finn', 3),
    (5, 'The Adventures of Tom Sawyer', 3);

INSERT INTO
    Sales (BookID, Quantity, SaleDate)
VALUES
    (1, 5, '2024-01-10'),
    (2, 3, '2024-01-15'),
    (3, 4, '2024-01-20'),
    (4, 2, '2024-02-10'),
    (5, 1, '2024-02-15');
