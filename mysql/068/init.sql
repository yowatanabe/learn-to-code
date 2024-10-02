-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Movies (MovieID INT PRIMARY KEY, MovieTitle VARCHAR(100));

CREATE TABLE
  Directors (
    DirectorID INT PRIMARY KEY,
    DirectorName VARCHAR(100),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES Movies (MovieID)
  );

-- 初期データ挿入
INSERT INTO
  Movies (MovieID, MovieTitle)
VALUES
  (1, 'Inception'),
  (2, 'Interstellar'),
  (3, 'Dunkirk'),
  (4, 'Tenet');

INSERT INTO
  Directors (DirectorID, DirectorName, MovieID)
VALUES
  (1, 'Christopher Nolan', 1),
  (2, 'Steven Spielberg', NULL),
  (3, 'Christopher Nolan', 3);
