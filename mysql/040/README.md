# No.040

あなたは、大学のコース管理システムを設計しています。このシステムでは、学生、コース、および各コースへの登録情報を管理する必要があります。各学生とコースには一意のIDがあり、それらの関係を記録するために主キーと外部キーの概念を使用します。

### テーブル設計

**Students テーブル:**

| StudentID | StudentName | Major           |
|-----------|-------------|-----------------|
| 1         | Alice       | Computer Science|
| 2         | Bob         | Mathematics     |
| 3         | Charlie     | Physics         |

**Courses テーブル:**

| CourseID | CourseName         | Credits |
|----------|--------------------|---------|
| 101      | Database Systems    | 3       |
| 102      | Calculus II         | 4       |
| 103      | Quantum Mechanics   | 3       |

**Enrollments テーブル:**

| EnrollmentID | StudentID | CourseID | EnrollmentDate |
|--------------|-----------|----------|----------------|
| 1            | 1         | 101      | 2024-09-05     |
| 2            | 2         | 102      | 2024-09-06     |
| 3            | 3         | 103      | 2024-09-07     |
| 4            | 1         | 103      | 2024-09-08     |
