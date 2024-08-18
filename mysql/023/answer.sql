-- 予算が50,000以上100,000以下のプロジェクトを選択
SELECT
  *
FROM
  Projects
WHERE
  Budget BETWEEN 50000 AND 100000;

-- プロジェクト名に「New」を含むプロジェクトを選択
SELECT
  *
FROM
  Projects
WHERE
  ProjectName LIKE '%New%';

-- 終了日がまだ設定されていない（EndDate が NULL）のプロジェクトを選択
SELECT
  *
FROM
  Projects
WHERE
  EndDate IS NULL;
