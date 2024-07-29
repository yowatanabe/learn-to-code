# No.003

新しいデータベースを作成し、その中に複数のテーブルを作成してください。また、これらのテーブルにデータを挿入してください。

以下の要件を満たすデータベースとテーブルを作成するSQL文を書いてください。

1. データベース名は `SchoolDB` とします。
2. テーブルは以下の3つを作成します：
    - **Students** テーブル: 学生の情報を管理します。
        - StudentID (INT, PRIMARY KEY)
        - StudentName (VARCHAR(100))
        - EnrollmentDate (DATE)
    - **Courses** テーブル: コースの情報を管理します。
        - CourseID (INT, PRIMARY KEY)
        - CourseName (VARCHAR(100))
    - **Enrollments** テーブル: 学生のコース登録情報を管理します。
        - EnrollmentID (INT, PRIMARY KEY)
        - StudentID (INT, FOREIGN KEY)
        - CourseID (INT, FOREIGN KEY)
        - Grade (CHAR(1))
