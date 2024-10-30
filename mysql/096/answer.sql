-- 1. トランザクションを使用した資金移動の操作
-- テーブルの確認
SELECT
  *
FROM
  Accounts;

-- トランザクションの開始
BEGIN;

-- 送金元のAliceの口座から1000を減算
UPDATE Accounts
SET
  Balance = Balance - 1000
WHERE
  AccountID = 1;

-- 送金先のBobの口座に1000を加算
UPDATE Accounts
SET
  Balance = Balance + 1000
WHERE
  AccountID = 2;

-- すべての操作が成功した場合のみコミット
COMMIT;

-- テーブルの確認
SELECT
  *
FROM
  Accounts;

-- 2. エラーハンドリングのためのロールバック
-- テーブルの確認
SELECT
  *
FROM
  Accounts;

-- トランザクションの開始
BEGIN;

-- 送金元のAliceの口座から1000を減算
UPDATE Accounts
SET
  Balance = Balance - 1000
WHERE
  AccountID = 1;

-- 送金先のBobの口座に1000を加算
UPDATE Accounts
SET
  Balance = Balance + 1000
WHERE
  AccountID = 2;

-- もしエラーが発生した場合
ROLLBACK;

-- テーブルの確認
SELECT
  *
FROM
  Accounts;
