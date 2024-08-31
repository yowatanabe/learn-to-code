-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
-- Booksテーブルの作成
CREATE TABLE
  Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL
  );

-- Borrowersテーブルの作成
CREATE TABLE
  Borrowers (
    BorrowerID INT PRIMARY KEY,
    BorrowerName VARCHAR(255) NOT NULL
  );

-- BorrowingRecordsテーブルの作成
CREATE TABLE
  BorrowingRecords (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    BorrowerID INT,
    BorrowDate DATE NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books (BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers (BorrowerID)
  );

-- 初期データの挿入
-- Booksテーブルにデータを挿入
INSERT INTO
  Books (BookID, Title, Author)
VALUES
  (1, 'The Catcher in the Rye', 'J.D. Salinger'),
  (2, 'To Kill a Mockingbird', 'Harper Lee'),
  (3, '1984', 'George Orwell');

-- Borrowersテーブルにデータを挿入
INSERT INTO
  Borrowers (BorrowerID, BorrowerName)
VALUES
  (1, 'Alice Johnson'),
  (2, 'Bob Smith'),
  (3, 'Charlie Brown');

-- BorrowingRecordsテーブルにデータを挿入
INSERT INTO
  BorrowingRecords (BookID, BorrowerID, BorrowDate)
VALUES
  (1, 1, '2024-09-01'),
  (2, 2, '2024-09-03'),
  (3, 3, '2024-09-05');
