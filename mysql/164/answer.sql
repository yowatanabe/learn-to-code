-- ユーザーIDが `2` の視聴履歴を取得するクエリ
SELECT
  *
FROM
  watch_history
WHERE
  user_id = 2;

-- インデックス追加前の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  watch_history
WHERE
  user_id = 2;

-- インデックスを追加
ALTER TABLE watch_history ADD INDEX idx_user_id (user_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  watch_history
WHERE
  user_id = 2;
