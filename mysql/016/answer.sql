-- データベースの作成
CREATE DATABASE LibraryDB;

-- データベースの選択
USE LibraryDB;

-- Documentsテーブルの作成
CREATE TABLE
  Documents (
    DocumentID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    PublishedDate DATE NOT NULL,
    WordCount INT NOT NULL,
    Content TEXT,
    Price DECIMAL(5, 2) NOT NULL
  );

-- 初期データの挿入
INSERT INTO
  Documents (
    Title,
    Author,
    PublishedDate,
    WordCount,
    Content,
    Price
  )
VALUES
  (
    'MySQL Guide',
    'John Doe',
    '2023-01-15',
    1200,
    'Intro to MySQL...',
    10.99
  ),
  (
    'SQL Basics',
    'Jane Smith',
    '2022-10-05',
    800,
    'SQL is a standard...',
    7.99
  ),
  (
    'Database Design',
    'Alice Johnson',
    '2021-07-22',
    1500,
    'Designing databases...',
    15.49
  );
