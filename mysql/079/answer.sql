-- 1. 各会員の総支払額 (`SUM`)
SELECT
  Members.MemberName,
  SUM(Sessions.Cost) AS TotalPayment
FROM
  Members
  JOIN Sessions ON Members.MemberID = Sessions.MemberID
GROUP BY
  Members.MemberName;

-- 2. 各会員の平均セッション時間 (`AVG`)
SELECT
  Members.MemberName,
  AVG(Sessions.Duration) AS AverageDuration
FROM
  Members
  JOIN Sessions ON Members.MemberID = Sessions.MemberID
GROUP BY
  Members.MemberName;

-- 3. 全会員のセッション回数 (`COUNT`)
SELECT
  COUNT(*) AS TotalSessions
FROM
  Sessions;

-- 4. 最大セッション時間 (`MAX`)
SELECT
  MAX(Sessions.Duration) AS MaxSessionDuration
FROM
  Sessions;

-- 5. 最小セッション時間 (`MIN`)
SELECT
  MIN(Sessions.Duration) AS MinSessionDuration
FROM
  Sessions;
