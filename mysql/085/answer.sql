-- 1. 各クラスごとの出席者数を集計するクエリ (`COUNT`)
SELECT
  Classes.ClassName,
  COUNT(Attendance.AttendanceID) AS AttendanceCount
FROM
  Classes
  JOIN Attendance ON Classes.ClassID = Attendance.ClassID
GROUP BY
  Classes.ClassName;

-- 2. 各インストラクターの担当クラスごとの出席者数を集計するクエリ (`COUNT`)
SELECT
  Classes.Instructor,
  COUNT(Attendance.AttendanceID) AS TotalAttendance
FROM
  Classes
  JOIN Attendance ON Classes.ClassID = Attendance.ClassID
GROUP BY
  Classes.Instructor;

-- 3. 曜日ごとの出席者数を集計するクエリ (`COUNT`)
SELECT
  DAYNAME (Attendance.AttendanceDate) AS DayOfWeek,
  COUNT(Attendance.AttendanceID) AS AttendanceCount
FROM
  Attendance
GROUP BY
  DayOfWeek;
