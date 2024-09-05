-- インデックスの作成
-- 部署ごとに社員を検索のパフォーマンスを向上させるためのインデックスを作成
CREATE INDEX idx_department ON Employees (Department);

-- インデックスを使用したクエリ
SELECT
  EmployeeName,
  Salary
FROM
  Employees
WHERE
  Department = 'Development';

-- インデックスの確認
SHOW INDEX
FROM
  Employees;
