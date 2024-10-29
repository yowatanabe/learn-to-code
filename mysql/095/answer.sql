-- パフォーマンスが低いクエリの例
SELECT
  Instructors.InstructorName,
  SUM(Enrollments.StudentCount) AS TotalStudents
FROM
  Instructors
  JOIN Courses ON Instructors.InstructorID = Courses.InstructorID
  JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
GROUP BY
  Instructors.InstructorName;

-- `EXPLAIN` を使用したクエリの解析
EXPLAIN
SELECT
  Instructors.InstructorName,
  SUM(Enrollments.StudentCount) AS TotalStudents
FROM
  Instructors
  JOIN Courses ON Instructors.InstructorID = Courses.InstructorID
  JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
GROUP BY
  Instructors.InstructorName;

-- インデックスの作成による最適化
CREATE INDEX idx_course_id ON Enrollments (CourseID);

-- インデックスを活用した最適化クエリ
SELECT
  Instructors.InstructorName,
  SUM(Enrollments.StudentCount) AS TotalStudents
FROM
  Instructors
  JOIN Courses ON Instructors.InstructorID = Courses.InstructorID
  JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
GROUP BY
  Instructors.InstructorName;

-- `EXPLAIN ANALYZE` を使用して実行プランの分析
EXPLAIN ANALYZE
SELECT
  Instructors.InstructorName,
  SUM(Enrollments.StudentCount) AS TotalStudents
FROM
  Instructors
  JOIN Courses ON Instructors.InstructorID = Courses.InstructorID
  JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
GROUP BY
  Instructors.InstructorName\G
