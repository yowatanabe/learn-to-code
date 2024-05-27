-- Q1
SELECT
  MajorName
FROM
  Majors m
WHERE
  EXISTS (
    SELECT
      1
    FROM
      Students s
    WHERE
      s.MajorID = m.MajorID
      AND s.Age >= 22
  );

-- Q2
SELECT
  StudentName
FROM
  Students
WHERE
  MajorID IN (
    SELECT
      MajorID
    FROM
      Majors
    WHERE
      MajorName IN ('Computer Science', 'Mathematics')
  );

-- Q3
SELECT
  StudentName
FROM
  Students
WHERE
  Age > ANY (
    SELECT
      Age
    FROM
      Students
    WHERE
      MajorID = (
        SELECT
          MajorID
        FROM
          Majors
        WHERE
          MajorName = 'Mathematics'
      )
  );

-- Q4
SELECT
  StudentName
FROM
  Students
WHERE
  Age > ALL (
    SELECT
      Age
    FROM
      Students
    WHERE
      MajorID = (
        SELECT
          MajorID
        FROM
          Majors
        WHERE
          MajorName = 'Computer Science'
      )
  );
