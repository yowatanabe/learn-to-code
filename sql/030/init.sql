-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS authors;

DROP TABLE IF EXISTS books;

CREATE TABLE
    authors (authorid INT, authorname VARCHAR(50));

CREATE TABLE
    books (bookid INT, booktitle VARCHAR(50), authorid INT);

-- INSERT DATA
INSERT INTO
    authors (authorid, authorname)
VALUES
    (1, 'J.K. Rowling'),
    (2, 'George Orwell'),
    (3, 'J.R.R. Tolkien'),
    (4, 'Mark Twain');

INSERT INTO
    books (bookid, booktitle, authorid)
VALUES
    (1, 'Harry Potter', 1),
    (2, '1984', 2),
    (3, 'The Hobbit', 3),
    (4, 'The Adventures of Tom Sawyer', 4),
    (5, 'Animal Farm', 2);
