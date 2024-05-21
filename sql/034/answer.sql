-- Q1
SELECT
  MajorName
FROM
  Majors
WHERE
  MajorID = (
    SELECT
      MajorID
    FROM
      Students
    GROUP BY
      MajorID
    ORDER BY
      COUNT(*) DESC
    LIMIT
      1
  );

-- Q2
SELECT
  s.StudentName,
  m.MajorName
FROM
  Students s
  JOIN Majors m ON s.MajorID = m.MajorID
WHERE
  s.MajorID = (
    SELECT
      MajorID
    FROM
      Students
    GROUP BY
      MajorID
    ORDER BY
      COUNT(*) DESC
    LIMIT
      1
  );
