-- 第1正規形 (1NF)
-- 1NFの要件を満たすために、各フィールドが単一値を保持するようにし、重複するグループを取り除きます。
CREATE TABLE
  Enrollments_1NF (
    EnrollmentID INT,
    StudentName VARCHAR(100),
    Course VARCHAR(100),
    Instructor VARCHAR(100)
  );

INSERT INTO
  Enrollments_1NF (EnrollmentID, StudentName, Course, Instructor)
VALUES
  (1, 'Alice', 'Math 101', 'Prof. Smith'),
  (1, 'Alice', 'History 201', 'Prof. Johnson'),
  (2, 'Bob', 'Chemistry 101', 'Prof. Clark'),
  (3, 'Charlie', 'Math 101', 'Prof. Smith'),
  (3, 'Charlie', 'Physics 202', 'Prof. Taylor'),
  (3, 'Charlie', 'History 201', 'Prof. Johnson');

-- 第2正規形 (2NF)
-- 2NFの要件を満たすために、部分関数従属性を排除します。ここでは、学生情報、コース情報、講師情報を別のテーブルに分割します。
CREATE TABLE
  Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(100)
  );

CREATE TABLE
  Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100)
  );

CREATE TABLE
  Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    InstructorName VARCHAR(100)
  );

CREATE TABLE
  Enrollments_2NF (
    EnrollmentID INT,
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses (CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors (InstructorID)
  );

INSERT INTO
  Students (StudentName)
VALUES
  ('Alice'),
  ('Bob'),
  ('Charlie');

INSERT INTO
  Courses (CourseName)
VALUES
  ('Math 101'),
  ('History 201'),
  ('Chemistry 101'),
  ('Physics 202');

INSERT INTO
  Instructors (InstructorName)
VALUES
  ('Prof. Smith'),
  ('Prof. Johnson'),
  ('Prof. Clark'),
  ('Prof. Taylor');

INSERT INTO
  Enrollments_2NF (EnrollmentID, StudentID, CourseID, InstructorID)
VALUES
  (1, 1, 1, 1),
  (1, 1, 2, 2),
  (2, 2, 3, 3),
  (3, 3, 1, 1),
  (3, 3, 4, 4),
  (3, 3, 2, 2);

-- 第3正規形 (3NF)
-- 3NFの要件を満たすために、推移的関数従属性を排除します。ここでは、すべてのテーブルが非キー属性に依存しないようにします。
-- 既に2NFで分割したテーブルは、3NFの要件を満たしているため、特別な変更は不要です。この段階では、各テーブルが完全に正規化され、冗長性が最小限に抑えられています。
