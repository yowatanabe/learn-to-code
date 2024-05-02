-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS books;

CREATE TABLE
    IF NOT EXISTS books (
        book_id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        author VARCHAR(255) NOT NULL,
        price DECIMAL(10, 2) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    books (title, author, price)
VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald', 14.99),
    ('1984', 'George Orwell', 19.99),
    ('To Kill a Mockingbird', 'Harper Lee', 24.99),
    ('The Catcher in the Rye', 'J.D. Salinger', 29.99),
    ('Pride and Prejudice', 'Jane Austen', 34.99);
