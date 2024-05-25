-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Books;

DROP TABLE IF EXISTS Authors;

CREATE TABLE
    Books (
        BookID INT,
        Title VARCHAR(100),
        AuthorID INT,
        Price INT
    );

CREATE TABLE
    Authors (AuthorID INT, AuthorName VARCHAR(100));

-- INSERT DATA
INSERT INTO
    Books (BookID, Title, AuthorID, Price)
VALUES
    (1, 'The Hobbit', 1, 15),
    (2, '1984', 2, 20),
    (3, 'The Catcher in the Rye', 3, 10),
    (4, 'To Kill a Mockingbird', 4, 25),
    (5, 'Brave New World', 2, 18);

INSERT INTO
    Authors (AuthorID, AuthorName)
VALUES
    (1, 'J.R.R. Tolkien'),
    (2, 'George Orwell'),
    (3, 'J.D. Salinger'),
    (4, 'Harper Lee');
