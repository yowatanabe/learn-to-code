-- `READ COMMITTED` での動作確認
-- `READ COMMITTED` 分離レベルでは、他のトランザクションがコミットした変更がすぐに反映される。
-- この場合、セッション1の2回目の `SELECT` は変更後の `Stock = 45` を確認できます。
-- セッション 1
-- READ COMMITTED の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;

-- Smartphone の在庫を確認
SELECT
  Stock
FROM
  Products
WHERE
  ProductID = 1;

-- セッション 2 のコミット後に再度在庫を確認
SELECT
  Stock
FROM
  Products
WHERE
  ProductID = 1;

COMMIT;

-- **セッション 2
BEGIN;

-- Smartphone の在庫を 45 に変更
UPDATE Products
SET
  Stock = 45
WHERE
  ProductID = 1;

COMMIT;

-- `REPEATABLE READ` での動作確認
-- 次に、`REPEATABLE READ` 分離レベルで同じ操作を行います。このレベルでは、トランザクション中は同じデータが一貫して見えるため、他のトランザクションのコミットが反映されません。
-- この場合、セッション1の2回目の `SELECT` でも最初に取得した在庫数 `Stock = 50` が表示され、変更は反映されません。
-- セッション 1
-- REPEATABLE READ の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN;

-- Smartphone の在庫を確認
SELECT
  Stock
FROM
  Products
WHERE
  ProductID = 1;

-- セッション 2 のコミット後に再度在庫を確認
SELECT
  Stock
FROM
  Products
WHERE
  ProductID = 1;

COMMIT;

-- セッション 2
BEGIN;

-- Smartphone の在庫を 45 に変更
UPDATE Products
SET
  Stock = 45
WHERE
  ProductID = 1;

COMMIT;
