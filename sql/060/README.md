# No.060

以下のようなテーブルがあります。

**Students テーブル:**

| StudentID | StudentName | Email              |
|-----------|-------------|--------------------|
| 1         | Alice       | alice@example.com  |
| 2         | Bob         | bob@example.com    |
| 3         | Charlie     | charlie@example.com|

**Courses テーブル:**

| CourseID | CourseName         |
|----------|--------------------|
| 101      | Mathematics        |
| 102      | History            |
| 103      | Computer Science   |

**Enrollments テーブル:**

| EnrollmentID | StudentID | CourseID | EnrollmentDate |
|--------------|-----------|----------|----------------|
| 1            | 1         | 101      | 2024-06-01     |
| 2            | 2         | 102      | 2024-06-02     |
| 3            | 1         | 103      | 2024-06-03     |
| 4            | 3         | 101      | 2024-06-04     |
| 5            | 2         | 103      | 2024-06-05     |

このテーブル構造において、主キー、外部キーの重要性を説明し、インデックスを作成するクエリを示してください。
