-- 悲観的ロックでは、`FOR UPDATE` を使用して他のトランザクションが同じ行をロックできないようにします。
-- 在庫を更新するトランザクションで、特定の商品の在庫をロックし、他のトランザクションが同時にアクセスするのを防ぎます。

-- 1. トランザクション開始
START TRANSACTION;

-- 2. 在庫の確認とロック
SELECT Stock FROM Products WHERE ProductID = 1 FOR UPDATE;

-- 3. 在庫を5減らす（例：TVを5台購入）
UPDATE Products SET Stock = Stock - 5 WHERE ProductID = 1;

-- 4. トランザクション終了
COMMIT;



-- 楽観的ロックは、通常はロックを取得せず、更新時に確認を行います。在庫更新の際に、現在の在庫数が購入時の在庫数と一致するかを確認し、一致しない場合は更新を中止します。

-- 1. 現在の在庫数を取得し、確認後に減算します。
SELECT ROW_COUNT();

-- 2. `WHERE` 条件に取得時の在庫数を入れて更新が競合したかをチェックします。

-- 2-1. 現在の在庫数を取得
SET @current_stock = (SELECT Stock FROM Products WHERE ProductID = 2);

-- 2-2. 在庫が変更されていない場合に更新
UPDATE Products
SET Stock = Stock - 3
WHERE ProductID = 2 AND Stock = @current_stock;

-- 3. 更新が成功したかどうかを確認
SELECT ROW_COUNT();
