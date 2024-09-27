-- `EXISTS` を使用。少なくとも1人のフォワード（Forward）が所属しているチームを表示。
SELECT
  TeamName
FROM
  Teams t
WHERE
  EXISTS (
    SELECT
      1
    FROM
      Players p
    WHERE
      p.TeamID = t.TeamID
      AND p.Position = 'Forward'
  );

-- `IN` を使用。フォワードまたはディフェンダーがいるチームを表示。
SELECT
  TeamName
FROM
  Teams
WHERE
  TeamID IN (
    SELECT
      TeamID
    FROM
      Players
    WHERE
      Position IN ('Forward', 'Defender')
  );

-- `ANY` を使用。フォワードよりも低い役職（ポジションの階層が数値として定義されている場合、仮に数値化）を持つ選手がいるチームを表示。
SELECT
  TeamName
FROM
  Teams
WHERE
  TeamID = ANY (
    SELECT
      TeamID
    FROM
      Players
    WHERE
      Position = 'Defender'
  );
