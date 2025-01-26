-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_year INT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE borrow_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    book_id INT,                              -- 外部キー
    borrower_name VARCHAR(100) NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);

-- 初期データ挿入
INSERT INTO books (title, author, published_year, genre) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction'),
('1984', 'George Orwell', 1949, 'Dystopian'),
('The Catcher in the Rye', 'J.D. Salinger', 1951, 'Fiction');

INSERT INTO borrow_records (book_id, borrower_name, borrow_date, return_date) VALUES
(1, 'Alice', '2024-01-01', '2024-01-15'),
(1, 'Bob', '2024-01-16', NULL),
(2, 'Charlie', '2024-01-10', '2024-01-20'),
(3, 'Diana', '2024-01-05', '2024-01-18'),
(3, 'Eve', '2024-01-19', NULL);
