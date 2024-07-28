-- データベースの作成
CREATE DATABASE LibraryDB;

-- データベースの選択
USE LibraryDB;

-- Authorsテーブルの作成
CREATE TABLE
  Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(100) NOT NULL
  );

-- Booksテーブルの作成
CREATE TABLE
  Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    PublishedDate DATE,
    FOREIGN KEY (AuthorID) REFERENCES Authors (AuthorID)
  );

-- Borrowersテーブルの作成
CREATE TABLE
  Borrowers (
    BorrowerID INT PRIMARY KEY AUTO_INCREMENT,
    BorrowerName VARCHAR(100) NOT NULL,
    BorrowedBookID INT,
    FOREIGN KEY (BorrowedBookID) REFERENCES Books (BookID)
  );

-- Authorsテーブルへのデータ挿入
INSERT INTO
  Authors (AuthorName)
VALUES
  ('J.K. Rowling'),
  ('George Orwell'),
  ('Mark Twain');

-- Booksテーブルへのデータ挿入
INSERT INTO
  Books (Title, AuthorID, PublishedDate)
VALUES
  ('Harry Potter', 1, '1997-01-01'),
  ('1984', 2, '1949-01-01'),
  ('Animal Farm', 2, '1945-01-01'),
  ('Adventures of Huckleberry Finn', 3, '1884-01-01'),
  ('The Adventures of Tom Sawyer', 3, '1876-01-01');

-- Borrowersテーブルへのデータ挿入
INSERT INTO
  Borrowers (BorrowerName, BorrowedBookID)
VALUES
  ('Alice', 1),
  ('Bob', 2),
  ('Charlie', 3);
