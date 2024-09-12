-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100),
    Plan VARCHAR(50),
    MonthlyFee DECIMAL(10, 2)
  ) ENGINE = InnoDB;

-- 初期データの挿入
INSERT INTO
  Users (UserID, UserName, Plan, MonthlyFee)
VALUES
  (1, 'Alice', 'Basic', 30.00),
  (2, 'Bob', 'Premium', 50.00),
  (3, 'Charlie', 'Basic', 30.00),
  (4, 'David', 'Premium', 50.00),
  (5, 'Eve', 'Basic', 30.00);
