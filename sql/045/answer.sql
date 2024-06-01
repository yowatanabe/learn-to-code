-- Q1
SELECT
  CONCAT (FirstName, ' ', LastName) AS FullName
FROM
  Students;

-- Q2
SELECT
  FirstName,
  LastName,
  GPA,
  GPA + 0.1 AS NewGPA
FROM
  Students;

-- Q3
SELECT
  FirstName,
  LastName,
  EnrollmentDate,
  TIMESTAMPDIFF (MONTH, EnrollmentDate, CURRENT_DATE) AS MonthsSinceEnrollment
FROM
  Students;
