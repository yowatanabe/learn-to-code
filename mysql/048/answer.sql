-- B-Treeインデックスの作成
-- `Plan` 列に対してB-Treeインデックスを作成し、ユーザーのプランごとの検索を効率化。
CREATE INDEX idx_plan ON Users (Plan);

-- B-Treeインデックスを使用したクエリ
SELECT
  UserName,
  Plan
FROM
  Users
WHERE
  Plan = 'Basic';

-- ハッシュインデックスの作成
-- ハッシュインデックスを作成するにはMemoryエンジンを使用する。`Plan`列にハッシュインデックスを適用して等価検索のパフォーマンスを最適化。
CREATE TABLE
  UsersHash (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100),
    Plan VARCHAR(50),
    MonthlyFee DECIMAL(10, 2)
  ) ENGINE = MEMORY;

INSERT INTO
  UsersHash (UserID, UserName, Plan, MonthlyFee)
VALUES
  (1, 'Alice', 'Basic', 30.00),
  (2, 'Bob', 'Premium', 50.00),
  (3, 'Charlie', 'Basic', 30.00),
  (4, 'David', 'Premium', 50.00),
  (5, 'Eve', 'Basic', 30.00);

-- ハッシュインデックスの作成
CREATE INDEX idx_hash_plan ON UsersHash (Plan) USING HASH;

-- ハッシュインデックスを使用したクエリ
SELECT
  UserName,
  Plan
FROM
  UsersHash
WHERE
  Plan = 'Premium';

-- インデックスの確認
SHOW INDEX
FROM
  Users;

SHOW INDEX
FROM
  UsersHash;
