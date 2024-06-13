# No.057

以下のようなテーブルがあります。

**Students テーブル:**

| StudentID | StudentName | Email                 |
|-----------|-------------|-----------------------|
| 1         | Alice       | alice@example.com     |
| 2         | Bob         | bob@example.com       |
| 3         | Charlie     | charlie@example.com   |
| 4         | David       | david@example.com     |

**Courses テーブル:**

| CourseID | CourseName      |
|----------|-----------------|
| 101      | Mathematics     |
| 102      | History         |
| 103      | Computer Science|

**Enrollments テーブル:**

| EnrollmentID | StudentID | CourseID | EnrollmentDate |
|--------------|-----------|----------|----------------|
| 1            | 1         | 101      | 2024-09-01     |
| 2            | 2         | 102      | 2024-09-02     |
| 3            | 3         | 103      | 2024-09-03     |
| 4            | 1         | 103      | 2024-09-04     |
| 5            | 4         | 101      | 2024-09-05     |

このテーブル構造において、主キー、外部キー、インデックスを作成するクエリを示してください。
