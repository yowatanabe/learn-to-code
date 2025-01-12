-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    published_year YEAR NOT NULL,
    genre VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE borrow_records (
    record_id INT AUTO_INCREMENT PRIMARY KEY, -- 主キー
    book_id INT,                              -- 外部キー
    borrower_name VARCHAR(100) NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE
    -- FOREIGN KEY (book_id) REFERENCES books(book_id) -- 外部キー制約
);

-- 初期データ挿入
INSERT INTO books (title, author, published_year, genre) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction'),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction'),
('1984', 'George Orwell', 1949, 'Dystopian'),
('Moby Dick', 'Herman Melville', 1901, 'Adventure'), -- 修正: 1851 → 1901
('War and Peace', 'Leo Tolstoy', 1902, 'Historical'); -- 修正: 1869 → 1902

INSERT INTO borrow_records (book_id, borrower_name, borrow_date, return_date)
SELECT
    FLOOR(RAND()*5) + 1,                       -- book_id: 1～5
    CONCAT('Borrower_', FLOOR(RAND()*100)),   -- borrower_name
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*60) DAY), -- 過去60日間のランダム日付
    NULL -- 未返却（ランダムに返却日を設定していない）
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
