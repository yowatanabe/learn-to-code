-- 1. イベントIDが `3` の参加者情報を取得するクエリ
SELECT
  *
FROM
  event_participants
WHERE
  event_id = 3;

-- インデックス追加前の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  event_participants
WHERE
  event_id = 3;

-- インデックスを追加
ALTER TABLE event_participants ADD INDEX idx_event_id (event_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  event_participants
WHERE
  event_id = 3;
