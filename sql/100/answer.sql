-- 回答1のクエリ
SELECT
    s.StudentName,
    c.CourseName,
    e.EnrollmentDate
FROM
    Enrollments e
    JOIN Students s ON e.StudentID = s.StudentID
    JOIN Courses c ON e.CourseID = c.CourseID;

-- 回答2のクエリ
SELECT
    c.CourseName,
    COUNT(e.StudentID) AS StudentCount
FROM
    Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY
    c.CourseName;
