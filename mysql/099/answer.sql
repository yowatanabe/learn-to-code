-- 確認
SELECT
  *
FROM
  Accounts;

-- トランザクションの開始
BEGIN;

-- Alice の口座から 2000 を減算（残高が不足する場合にエラー）
UPDATE Accounts
SET
  Balance = Balance - 2000
WHERE
  AccountID = 1;

-- Bob の口座に 2000 を加算
UPDATE Accounts
SET
  Balance = Balance + 2000
WHERE
  AccountID = 2;

-- エラーが発生したためロールバック
ROLLBACK;

-- 確認
SELECT
  *
FROM
  Accounts;

-- トランザクションの開始
BEGIN;

-- Alice の口座から 2000 を減算（残高が不足する場合にエラー）
UPDATE Accounts
SET
  Balance = Balance - 2000
WHERE
  AccountID = 1;

-- Bob の口座に 2000 を加算
UPDATE Accounts
SET
  Balance = Balance + 2000
WHERE
  AccountID = 2;

-- コミット（BobのUPDATEのみ反映される）
COMMIT;

-- 確認
SELECT
  *
FROM
  Accounts;
