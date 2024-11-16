-- 悲観的ロックでは、`FOR UPDATE` を使用して、他のトランザクションが同時にアクセスできないようにします。

-- トランザクション開始
START TRANSACTION;

-- 在庫をロックして取得
SELECT Stock FROM Products WHERE ProductID = 1 FOR UPDATE;

-- 在庫を更新（例：TVを10台購入）
UPDATE Products SET Stock = Stock - 10 WHERE ProductID = 1;

-- トランザクション終了
COMMIT;


-- 楽観的ロックでは、通常はロックを取得せず、更新時に競合が発生した場合にのみ対処します。

-- 現在の在庫とバージョンを取得
SET @current_stock = (SELECT Stock FROM Products WHERE ProductID = 2);
SET @current_version = (SELECT Version FROM Products WHERE ProductID = 2);

-- 在庫とバージョンが一致する場合のみ更新
UPDATE Products
SET Stock = Stock - 5, Version = Version + 1
WHERE ProductID = 2 AND Stock = @current_stock AND Version = @current_version;

-- 更新が成功したか確認
SELECT ROW_COUNT();
