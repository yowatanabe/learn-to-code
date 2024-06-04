-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Books;

CREATE TABLE
    Books (
        BookID INT,
        Title VARCHAR(100),
        Author VARCHAR(100)
    );

-- INSERT DATA
INSERT INTO
    Books (BookID, Title, Author)
VALUES
    (1, 'The Great Gatsby', 'F. Scott Fitzgerald'),
    (2, 'To Kill a Mockingbird', 'Harper Lee'),
    (3, '1984', 'George Orwell'),
    (4, 'Brave New World', 'Aldous Huxley'),
    (5, 'The Catcher in the Rye', 'J.D. Salinger'),
    (6, 'Great Expectations', 'Charles Dickens'),
    (7, 'The Grapes of Wrath', 'John Steinbeck');
