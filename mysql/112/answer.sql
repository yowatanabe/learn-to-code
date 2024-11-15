-- 悲観的ロックを使用したトランザクション

-- 確認
SELECT * FROM Products;

-- トランザクション開始
START TRANSACTION;

-- 在庫の確認とロック
SELECT Stock FROM Products WHERE ProductID = 1 FOR UPDATE;

-- 在庫を3減らす（例：TVを3台購入）
UPDATE Products SET Stock = Stock - 3 WHERE ProductID = 1;

-- トランザクション終了
COMMIT;

-- 確認
SELECT * FROM Products;


-- 楽観的ロックによる更新

-- 確認
SELECT * FROM Products;

-- 現在の在庫とバージョン番号を取得
SET @current_stock = (SELECT Stock FROM Products WHERE ProductID = 2);
SET @current_version = (SELECT Version FROM Products WHERE ProductID = 2);

-- 在庫が変更されていない場合のみ更新
UPDATE Products
SET Stock = Stock - 2, Version = Version + 1
WHERE ProductID = 2 AND Stock = @current_stock AND Version = @current_version;

-- 確認
SELECT * FROM Products;
