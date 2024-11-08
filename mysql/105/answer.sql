-- `READ COMMITTED` での動作確認
-- `READ COMMITTED` 分離レベルでは、他のトランザクションがコミットした後の変更が即座に反映されるため、途中でデータが変わる可能性があります。

-- セッション 1
-- READ COMMITTED の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;

-- Camera の在庫を確認
SELECT
  Stock
FROM
  Inventory
WHERE
  ProductID = 1;

-- セッション 2 のコミット後に再度在庫を確認
SELECT
  Stock
FROM
  Inventory
WHERE
  ProductID = 1;

COMMIT;

-- セッション 2
BEGIN;

-- Camera の在庫を 10 に減らす
UPDATE Inventory
SET
  Stock = 10
WHERE
  ProductID = 1;

COMMIT;

-- セッション 1 で最初の `SELECT` は `Stock = 15` を表示しますが、セッション 2 のコミット後に再度 `SELECT` すると、`Stock = 10` に変わります。


-- `REPEATABLE READ` での動作確認
-- 次に、`REPEATABLE READ` 分離レベルで同様の操作を行います。この分離レベルではトランザクション中の読み取りが一貫しているため、データの一貫性が保たれます。

-- セッション 1
-- REPEATABLE READ の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN;

-- Camera の在庫を確認
SELECT
  Stock
FROM
  Inventory
WHERE
  ProductID = 1;

-- セッション 2 のコミット後に再度在庫を確認
SELECT
  Stock
FROM
  Inventory
WHERE
  ProductID = 1;

COMMIT;

-- セッション 2
BEGIN;

-- Camera の在庫を 10 に減らす
UPDATE Inventory
SET
  Stock = 10
WHERE
  ProductID = 1;

COMMIT;

-- この場合、セッション 1 の最初と2回目の `SELECT` はどちらも `Stock = 15` を表示し、他のトランザクションでの変更がトランザクション中には反映されません。
