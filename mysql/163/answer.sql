-- ユーザーIDが `3` のユーザーが投稿したブログ一覧を取得するクエリ
SELECT
  *
FROM
  posts
WHERE
  user_id = 3;

-- インデックスを追加する前後のパフォーマンス比較
EXPLAIN
SELECT
  *
FROM
  posts
WHERE
  user_id = 3;

-- インデックスを追加
ALTER TABLE posts ADD INDEX idx_user_id (user_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  posts
WHERE
  user_id = 3;
