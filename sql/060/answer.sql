-- Q1
ALTER TABLE Students ADD PRIMARY KEY (StudentID);

ALTER TABLE Courses ADD PRIMARY KEY (CourseID);

ALTER TABLE Enrollments ADD PRIMARY KEY (EnrollmentID);

-- Q2
ALTER TABLE Enrollments ADD CONSTRAINT fk_student FOREIGN KEY (StudentID) REFERENCES Students (StudentID);

ALTER TABLE Enrollments ADD CONSTRAINT fk_course FOREIGN KEY (CourseID) REFERENCES Courses (CourseID);

-- Q3
CREATE INDEX idx_enrollment_date ON Enrollments (EnrollmentDate);
