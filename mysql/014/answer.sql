-- データベースの作成
CREATE DATABASE LibraryDB;

-- データベースの選択
USE LibraryDB;

-- Booksテーブルの作成
CREATE TABLE
  Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    PublishDate DATE NOT NULL,
    Price DECIMAL(5, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Books (Title, Author, PublishDate, Price)
VALUES
  (
    'The Great Gatsby',
    'F. Scott Fitzgerald',
    '1925-04-10',
    10.99
  ),
  (
    'To Kill a Mockingbird',
    'Harper Lee',
    '1960-07-11',
    7.99
  ),
  ('1984', 'George Orwell', '1949-06-08', 8.99);

-- すべての本のタイトルと著者を選択するクエリ
SELECT
  Title,
  Author
FROM
  Books;

-- 特定の価格より高い本を選択するクエリ（例: 8.00ドル以上の価格の本）
SELECT
  Title,
  Price
FROM
  Books
WHERE
  Price >= 8.00;

-- 新しい本を追加するクエリ
INSERT INTO
  Books (Title, Author, PublishDate, Price)
VALUES
  (
    'Brave New World',
    'Aldous Huxley',
    '1932-08-18',
    9.99
  );

-- 特定の本の価格を更新するクエリ（例: '1984' の価格を9.49に更新）
UPDATE Books
SET
  Price = 9.49
WHERE
  Title = '1984';

-- 特定の本を削除するクエリ（例: 'To Kill a Mockingbird' を削除）
DELETE FROM Books
WHERE
  Title = 'To Kill a Mockingbird';
