-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Books;

DROP TABLE IF EXISTS Borrowers;

DROP TABLE IF EXISTS BorrowedBooks;

CREATE TABLE
    Books (
        BookID INT PRIMARY KEY,
        Title VARCHAR(100),
        Author VARCHAR(100),
        Quantity INT
    );

CREATE TABLE
    Borrowers (
        BorrowerID INT PRIMARY KEY,
        BorrowerName VARCHAR(50)
    );

CREATE TABLE
    BorrowedBooks (
        BorrowID INT PRIMARY KEY,
        BookID INT,
        BorrowerID INT,
        BorrowDate DATE,
        FOREIGN KEY (BookID) REFERENCES Books (BookID),
        FOREIGN KEY (BorrowerID) REFERENCES Borrowers (BorrowerID)
    );

-- INSERT DATA
INSERT INTO
    Books (BookID, Title, Author, Quantity)
VALUES
    (1, '1984', 'George Orwell', 10),
    (2, 'To Kill a Mockingbird', 'Harper Lee', 5),
    (3, 'The Great Gatsby', 'F. Scott Fitzgerald', 7);

INSERT INTO
    Borrowers (BorrowerID, BorrowerName)
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');

INSERT INTO
    BorrowedBooks (BorrowID, BookID, BorrowerID, BorrowDate)
VALUES
    (1, 1, 1, '2024-07-01'),
    (2, 2, 2, '2024-07-05');
