-- 講座IDが `2` の受講履歴を取得するクエリ
SELECT
  *
FROM
  enrollments
WHERE
  course_id = 2;

-- インデックス追加前の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  enrollments
WHERE
  course_id = 2;

-- インデックスを追加
ALTER TABLE enrollments ADD INDEX idx_course_id (course_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  enrollments
WHERE
  course_id = 2;
