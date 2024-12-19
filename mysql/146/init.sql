-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    published_year INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    loan_date DATE,
    return_date DATE
    -- 故意にINDEXを作成しない状態
);

-- 初期データ挿入
INSERT INTO books (title, author, published_year) VALUES
('MySQL入門', 'Tanaka', 2020),
('データベース設計論', 'Suzuki', 2018),
('クラウド時代のSRE', 'Kato', 2021),
('システムパフォーマンス改善', 'Yamada', 2019),
('ネットワーク基礎', 'Watanabe', 2017),
('セキュリティ入門', 'Ito', 2020),
('Linux運用ガイド', 'Hara', 2022),
('フロントエンド開発', 'Nakajima', 2021),
('インフラ構築術', 'Sasaki', 2023),
('DevOps実践', 'Mori', 2022);

INSERT INTO loans (book_id, user_id, loan_date, return_date)
SELECT
    FLOOR(RAND()*10) + 1,
    FLOOR(RAND()*1000) + 1,
    DATE_ADD(CURDATE(), INTERVAL -FLOOR(RAND()*60) DAY),
    NULL  -- 返却日をNULLとする（未返却想定）、あるいはランダムで日付を入れてもよい
FROM
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t1,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t2,
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5) t3;
