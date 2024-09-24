-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Price DECIMAL(10, 2)
  );

CREATE TABLE
  BorrowedBooks (
    BorrowID INT PRIMARY KEY,
    BookID INT,
    BorrowerName VARCHAR(100),
    BorrowDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books (BookID)
  );

-- 初期データ挿入
INSERT INTO
  Books (BookID, Title, Author, Price)
VALUES
  (1, 'Book A', 'Author A', 50.00),
  (2, 'Book B', 'Author B', 45.00),
  (3, 'Book C', 'Author C', 55.00),
  (4, 'Book D', 'Author D', 70.00),
  (5, 'Book E', 'Author E', 60.00);

INSERT INTO
  BorrowedBooks (BorrowID, BookID, BorrowerName, BorrowDate)
VALUES
  (1, 1, 'Borrower A', '2024-09-01'),
  (2, 3, 'Borrower B', '2024-09-02'),
  (3, 2, 'Borrower C', '2024-09-03'),
  (4, 5, 'Borrower A', '2024-09-04'),
  (5, 4, 'Borrower E', '2024-09-05');
