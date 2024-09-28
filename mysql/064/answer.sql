-- `EXISTS` を使用。少なくとも1人の11年生が所属しているクラブを表示。
SELECT
  ClubName
FROM
  Clubs c
WHERE
  EXISTS (
    SELECT
      1
    FROM
      Students s
    WHERE
      s.ClubID = c.ClubID
      AND s.GradeLevel = 11
  );

-- `IN` を使用。11年生または10年生の生徒が所属するクラブを表示。
SELECT
  ClubName
FROM
  Clubs
WHERE
  ClubID IN (
    SELECT
      ClubID
    FROM
      Students
    WHERE
      GradeLevel IN (10, 11)
  );

-- `ANY` を使用。11年生より低い学年（例えば、10年生）の生徒が所属するクラブを表示。
SELECT
  ClubName
FROM
  Clubs
WHERE
  ClubID = ANY (
    SELECT
      ClubID
    FROM
      Students
    WHERE
      GradeLevel < 11
  );
