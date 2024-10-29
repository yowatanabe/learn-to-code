# No.095

あなたは、オンライン教育プラットフォームのデータベースを管理しています。データベースには、講師、講座、および受講記録が含まれており、頻繁に使用されるクエリのパフォーマンスを向上させる必要があります。特に、講師ごとの総受講者数を素早く集計できるクエリが求められています。

### テーブル設計

**Instructors テーブル:**

| InstructorID | InstructorName |
|--------------|----------------|
| 1            | Alice Johnson  |
| 2            | Bob Smith      |
| 3            | Carol Lee      |

**Courses テーブル:**

| CourseID | CourseName         | InstructorID |
|----------|---------------------|--------------|
| 101      | Data Science 101   | 1            |
| 102      | Machine Learning   | 1            |
| 103      | Python Programming | 2            |
| 104      | Web Development    | 3            |

**Enrollments テーブル:**

| EnrollmentID | CourseID | EnrollmentDate | StudentCount |
|--------------|----------|----------------|--------------|
| 1            | 101      | 2024-10-30     | 50           |
| 2            | 102      | 2024-11-01     | 30           |
| 3            | 103      | 2024-11-02     | 20           |
| 4            | 101      | 2024-11-03     | 25           |
| 5            | 104      | 2024-11-04     | 40           |
