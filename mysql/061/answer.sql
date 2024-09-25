-- `EXISTS` を使用。プロジェクトにタスクが存在するかを確認し、タスクのあるプロジェクトだけを表示。
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

-- `IN` を使用。特定のタスクが含まれているプロジェクトを取得。
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
      TaskName IN ('Design', 'Testing')
  );

-- `ANY` を使用。タスクの中で最も多くの時間が割かれたタスクが20時間未満のプロジェクトを検索。
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
      HoursWorked < 20
  );
