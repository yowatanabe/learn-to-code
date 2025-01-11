-- 従業員IDが `2` のシフト情報を取得するクエリ
SELECT
  *
FROM
  shifts
WHERE
  employee_id = 2;

-- インデックス追加前の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  shifts
WHERE
  employee_id = 2;

-- インデックスを追加
ALTER TABLE shifts ADD INDEX idx_employee_id (employee_id);

-- インデックス追加後の `EXPLAIN` 結果
EXPLAIN
SELECT
  *
FROM
  shifts
WHERE
  employee_id = 2;
