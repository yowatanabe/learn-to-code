-- サブクエリを使って、平均点以上の成績を持つ学生の名前を表示するクエリ
SELECT
  StudentName
FROM
  Students
WHERE
  StudentID IN (
    SELECT
      StudentID
    FROM
      Grades
    WHERE
      Grade >= (
        SELECT
          AVG(Grade)
        FROM
          Grades
      )
  );

-- 最高成績を取得した学生の名前を表示するクエリ
SELECT
  StudentName
FROM
  Students
WHERE
  StudentID = (
    SELECT
      StudentID
    FROM
      Grades
    ORDER BY
      Grade DESC
    LIMIT
      1
  );
