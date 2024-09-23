# No.059

あなたは、大学の成績管理システムを担当しています。学生の成績を管理し、特定の条件に基づいて成績を検索するためにサブクエリを使用します。

### テーブル設計

**Students テーブル:**

| StudentID | StudentName | Major        |
|-----------|-------------|--------------|
| 1         | Alice       | Computer Science |
| 2         | Bob         | Mathematics  |
| 3         | Charlie     | Computer Science |
| 4         | David       | Physics      |
| 5         | Eve         | Mathematics  |

**Grades テーブル:**

| GradeID | StudentID | Course     | Grade  |
|---------|-----------|------------|--------|
| 1       | 1         | Math 101   | 85     |
| 2       | 1         | CS 101     | 90     |
| 3       | 2         | Math 101   | 78     |
| 4       | 3         | CS 101     | 95     |
| 5       | 4         | Physics 101| 88     |
| 6       | 5         | Math 101   | 92     |
