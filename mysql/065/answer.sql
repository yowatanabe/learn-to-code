-- `EXISTS` を使用。少なくとも1つのタスクが存在するプロジェクトを表示。
SELECT
  ProjectName
FROM
  Projects p
WHERE
  EXISTS (
    SELECT
      1
    FROM
      Tasks t
    WHERE
      t.ProjectID = p.ProjectID
  );

-- `IN` を使用。20時間以上かかったタスクが存在するプロジェクトを表示。
SELECT
  ProjectName
FROM
  Projects
WHERE
  ProjectID IN (
    SELECT
      ProjectID
    FROM
      Tasks
    WHERE
      HoursSpent >= 20
  );

-- `ANY` を使用。最も時間のかかったタスクよりも少ない時間がかかったプロジェクトを表示。
SELECT
  ProjectName
FROM
  Projects
WHERE
  ProjectID = ANY (
    SELECT
      ProjectID
    FROM
      Tasks
    WHERE
      HoursSpent < (
        SELECT
          MAX(HoursSpent)
        FROM
          Tasks
      )
  );
