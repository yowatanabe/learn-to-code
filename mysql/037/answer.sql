-- 学生が登録したコースとそのインストラクターを取得するクエリ
SELECT
  Students.StudentName,
  Courses.CourseName,
  Courses.Instructor,
  Enrollments.EnrollmentDate
FROM
  Enrollments
  JOIN Students ON Enrollments.StudentID = Students.StudentID
  JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
