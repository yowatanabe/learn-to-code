-- 学生が登録したコースとその情報を取得するクエリ
SELECT
  Students.StudentName,
  Courses.CourseName,
  Courses.Credits,
  Enrollments.EnrollmentDate
FROM
  Enrollments
  JOIN Students ON Enrollments.StudentID = Students.StudentID
  JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
