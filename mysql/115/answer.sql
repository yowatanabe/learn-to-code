-- 悲観的ロックを使用して、同じ商品の在庫が同時に更新されないようにする

-- トランザクション開始
START TRANSACTION;

-- 在庫をロックして取得
SELECT Stock FROM Products WHERE ProductID = 1 FOR UPDATE;

-- 在庫を10減らす
UPDATE Products SET Stock = Stock - 10 WHERE ProductID = 1;

-- トランザクション終了
COMMIT;


-- 楽観的ロックでは通常はロックを使用せず、更新時にデータの競合を確認する

-- 現在の在庫とバージョンを取得
SET @current_stock = (SELECT Stock FROM Products WHERE ProductID = 2);
SET @current_version = (SELECT Version FROM Products WHERE ProductID = 2);

-- 在庫とバージョンが一致する場合のみ更新
UPDATE Products
SET Stock = Stock - 5, Version = Version + 1
WHERE ProductID = 2 AND Stock = @current_stock AND Version = @current_version;

-- 更新が成功したか確認
SELECT ROW_COUNT();
