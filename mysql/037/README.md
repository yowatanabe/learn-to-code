# No.037

あなたは、オンラインコース管理システムを設計しています。学生、コース、および各コースへの登録情報を管理する必要があります。各コースと学生は一意のIDを持ち、それらの関係を記録するために主キーと外部キーの概念を使用します。

### テーブル設計

**Students テーブル:**

| StudentID | StudentName | Email                |
|-----------|-------------|----------------------|
| 1         | Alice       | alice@example.com    |
| 2         | Bob         | bob@example.com      |
| 3         | Charlie     | charlie@example.com  |

**Courses テーブル:**

| CourseID | CourseName           | Instructor       |
|----------|----------------------|------------------|
| 1        | Database Systems     | Dr. Smith        |
| 2        | Network Security     | Dr. Johnson      |
| 3        | Operating Systems    | Dr. Brown        |

**Enrollments テーブル:**

| EnrollmentID | StudentID | CourseID | EnrollmentDate |
|--------------|-----------|----------|----------------|
| 1            | 1         | 1        | 2024-09-02     |
| 2            | 2         | 2        | 2024-09-03     |
| 3            | 3         | 3        | 2024-09-04     |
| 4            | 1         | 3        | 2024-09-05     |
