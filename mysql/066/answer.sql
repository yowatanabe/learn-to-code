-- `INNER JOIN` を使用。授業に登録された学生の情報のみを表示。
SELECT
  Students.StudentName,
  Courses.CourseName
FROM
  Students
  INNER JOIN Courses ON Students.StudentID = Courses.StudentID;

-- `LEFT JOIN` を使用。学生が授業に登録されていなくても全ての学生を表示。右側（`Courses`）に一致するデータがない場合は `NULL` が表示される。
SELECT
  Students.StudentName,
  Courses.CourseName
FROM
  Students
  LEFT JOIN Courses ON Students.StudentID = Courses.StudentID;

-- `RIGHT JOIN` を使用。授業に登録されているが学生情報が存在しない場合でも授業情報を表示。左側（`Students`）に一致するデータがない場合は `NULL` が表示される。
SELECT
  Students.StudentName,
  Courses.CourseName
FROM
  Students
  RIGHT JOIN Courses ON Students.StudentID = Courses.StudentID;

-- `FULL OUTER JOIN` を使用。どちらのテーブルにも存在しないデータを含めて両方のテーブルからすべてのデータを結合。どちらか一方にデータがない場合は `NULL` が表示される。
SELECT
  Students.StudentName,
  Courses.CourseName
FROM
  Students
  LEFT JOIN Courses ON Students.StudentID = Courses.StudentID
UNION
SELECT
  Students.StudentName,
  Courses.CourseName
FROM
  Students
  RIGHT JOIN Courses ON Students.StudentID = Courses.StudentID;
