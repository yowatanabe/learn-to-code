-- 悲観的ロックを使用して、他のトランザクションが同時に同じアカウントを更新できないようにします。

-- トランザクション開始
START TRANSACTION;

-- 残高をロックして取得
SELECT Balance FROM Accounts WHERE AccountID = 1 FOR UPDATE;

-- 残高を500引き出す
UPDATE Accounts SET Balance = Balance - 500 WHERE AccountID = 1;

-- トランザクション終了
COMMIT;


-- 楽観的ロックを使用して、更新時に競合がないか確認します。

-- 現在の残高とバージョン番号を取得
SET @current_balance = (SELECT Balance FROM Accounts WHERE AccountID = 2);
SET @current_version = (SELECT Version FROM Accounts WHERE AccountID = 2);

-- バージョン番号が一致する場合のみ残高を更新
UPDATE Accounts
SET Balance = Balance - 300, Version = Version + 1
WHERE AccountID = 2 AND Version = @current_version;

-- 更新が成功したか確認
SELECT ROW_COUNT();
