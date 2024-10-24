-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150),
    Author VARCHAR(100),
    Category VARCHAR(50)
  );

CREATE TABLE
  Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    LoanDate DATE,
    ReturnDate DATE,
    MemberID INT,
    FOREIGN KEY (BookID) REFERENCES Books (BookID)
  );

CREATE TABLE
  Members (MemberID INT PRIMARY KEY, MemberName VARCHAR(100));

-- 初期データ挿入
INSERT INTO
  Books (BookID, Title, Author, Category)
VALUES
  (1, 'SQL Fundamentals', 'John Smith', 'Technology'),
  (
    2,
    'Learning Python',
    'Mark Johnson',
    'Technology'
  ),
  (3, 'Mystery of the Mind', 'Anna Brown', 'Fiction'),
  (4, 'Cooking 101', 'Emma Davis', 'Cooking');

INSERT INTO
  Loans (LoanID, BookID, LoanDate, ReturnDate, MemberID)
VALUES
  (101, 1, '2024-10-01', '2024-10-10', 1),
  (102, 2, '2024-10-03', '2024-10-12', 2),
  (103, 3, '2024-10-05', '2024-10-15', 3),
  (104, 1, '2024-10-07', '2024-10-17', 4),
  (105, 4, '2024-10-09', NULL, 1);

INSERT INTO
  Members (MemberID, MemberName)
VALUES
  (1, 'Alice White'),
  (2, 'Bob Green'),
  (3, 'Charlie Black'),
  (4, 'Diana Yellow');
