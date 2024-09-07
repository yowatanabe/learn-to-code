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
  Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    BookID INT,
    OrderDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books (BookID)
  );

-- 初期データの挿入
-- Booksテーブルにデータを挿入
INSERT INTO
  Books (BookID, Title, Author, Price)
VALUES
  (1, 'Clean Code', 'Robert Martin', 50.00),
  (
    2,
    'The Pragmatic Programmer',
    'Andrew Hunt',
    40.00
  ),
  (3, 'Design Patterns', 'Erich Gamma', 60.00),
  (4, 'Refactoring', 'Martin Fowler', 45.00);

-- Ordersテーブルにデータを挿入
INSERT INTO
  Orders (OrderID, CustomerName, BookID, OrderDate)
VALUES
  (101, 'Alice', 1, '2024-09-08'),
  (102, 'Bob', 2, '2024-09-09'),
  (103, 'Charlie', 3, '2024-09-10'),
  (104, 'Alice', 4, '2024-09-11'),
  (105, 'Bob', 1, '2024-09-12');
