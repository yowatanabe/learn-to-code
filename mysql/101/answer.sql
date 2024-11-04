-- `READ COMMITTED` での動作確認
-- 1つ目のセッションで `READ COMMITTED` を設定し、残高の確認を行うと同時に、2つ目のセッションで残高を更新。
-- セッション 1
-- READ COMMITTED の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;

-- Alice の残高を確認
SELECT
  Balance
FROM
  Accounts
WHERE
  AccountID = 1;

-- ここでセッション 2 が変更を加える
COMMIT;

-- セッション 2
BEGIN;

-- Alice の残高を 500 減らす
UPDATE Accounts
SET
  Balance = Balance - 500
WHERE
  AccountID = 1;

COMMIT;

-- `SERIALIZABLE` での動作確認
-- `SERIALIZABLE` では他のトランザクションによる変更がブロックされ、現在のトランザクションが完了するまで一貫したデータが保証されます。
-- セッション 1
-- SERIALIZABLE の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

BEGIN;

-- Alice の残高を確認
SELECT
  Balance
FROM
  Accounts
WHERE
  AccountID = 1;

-- ここでセッション 2 が変更を試みるがブロックされる
COMMIT;

-- セッション 2
BEGIN;

-- Alice の残高を 500 減らす（セッション 1 の完了を待機）
UPDATE Accounts
SET
  Balance = Balance - 500
WHERE
  AccountID = 1;

COMMIT;
