-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS Books;

CREATE TABLE
    Books (
        BookID INT PRIMARY KEY,
        Title VARCHAR(100),
        Author VARCHAR(100),
        Genre VARCHAR(50),
        PublishDate DATE,
        Price DECIMAL(10, 2)
    );

-- INSERT DATA
INSERT INTO
    Books (BookID, Title, Author, Genre, PublishDate, Price)
VALUES
    (
        1,
        'To Kill a Mockingbird',
        'Harper Lee',
        'Fiction',
        '1960-07-11',
        10.99
    ),
    (
        2,
        '1984',
        'George Orwell',
        'Dystopian',
        '1949-06-08',
        8.99
    ),
    (
        3,
        'Moby Dick',
        'Herman Melville',
        'Fiction',
        '1851-10-18',
        12.99
    ),
    (
        4,
        'The Great Gatsby',
        'F. Scott Fitzgerald',
        'Fiction',
        '1925-04-10',
        10.99
    ),
    (
        5,
        'Brave New World',
        'Aldous Huxley',
        'Dystopian',
        '1932-08-31',
        9.99
    );
