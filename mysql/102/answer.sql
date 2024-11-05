-- `READ UNCOMMITTED` での動作確認
-- `READ UNCOMMITTED` 分離レベルでは、他のトランザクションで未確定の変更が見えてしまう可能性があるため、在庫更新のトランザクションがコミットされる前に在庫が変化しているのを確認する。
-- READ UNCOMMITTED の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

BEGIN;

-- Laptop の在庫を確認
SELECT
  Stock
FROM
  Inventory
WHERE
  ProductID = 1;

-- 在庫が変更される
COMMIT;

BEGIN;

-- Laptop の在庫を一時的に 8 に変更
UPDATE Inventory
SET
  Stock = 8
WHERE
  ProductID = 1;

-- コミットする前にセッション 1 が変更を読み取る可能性あり
COMMIT;

-- `REPEATABLE READ` での動作確認
-- 次に、`REPEATABLE READ` 分離レベルで同様の処理を行う。トランザクションが開始された後のデータ変更が見えなくなるためデータの一貫性がより強く保たれる。
-- REPEATABLE READ の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN;

-- Laptop の在庫を確認
SELECT
  Stock
FROM
  Inventory
WHERE
  ProductID = 1;

-- ここでセッション 2 で在庫が変更されるが、トランザクション中は反映されない
COMMIT;

BEGIN;

-- Laptop の在庫を一時的に 8 に変更
UPDATE Inventory
SET
  Stock = 8
WHERE
  ProductID = 1;

COMMIT;

-- Laptop の在庫を確認
SELECT
  Stock
FROM
  Inventory
WHERE
  ProductID = 1;
