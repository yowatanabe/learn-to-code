#### 第1正規形（1NF）

第1正規形では、各フィールドが単一の値を持つようにします。このテーブルは既に第1正規形に従っています。

**Enrollment テーブル:**

| EnrollmentID | StudentName | StudentAddress  | CourseName      | Instructor   | EnrollmentDate |
|--------------|-------------|-----------------|-----------------|--------------|----------------|
| 1            | Alice       | 123 Maple St    | Math 101        | Dr. Smith    | 2023-09-01     |
| 2            | Bob         | 456 Oak St      | History 201     | Dr. Brown    | 2023-09-01     |
| 3            | Charlie     | 789 Pine St     | Math 101        | Dr. Smith    | 2023-09-01     |
| 4            | Alice       | 123 Maple St    | Physics 301     | Dr. Johnson  | 2023-09-02     |
| 5            | Bob         | 456 Oak St      | Math 101        | Dr. Smith    | 2023-09-02     |

#### 第2正規形（2NF）

第2正規形では、部分的関数従属を排除します。つまり、主キーの一部だけに依存する属性を別のテーブルに分けます。この場合、学生情報とコース情報を分けます。

**Students テーブル:**

| StudentID | StudentName | StudentAddress |
|-----------|-------------|----------------|
| 1         | Alice       | 123 Maple St   |
| 2         | Bob         | 456 Oak St     |
| 3         | Charlie     | 789 Pine St    |

**Courses テーブル:**

| CourseID | CourseName  | Instructor   |
|----------|-------------|--------------|
| 1        | Math 101    | Dr. Smith    |
| 2        | History 201 | Dr. Brown    |
| 3        | Physics 301 | Dr. Johnson  |

**Enrollment テーブル:**

| EnrollmentID | StudentID | CourseID | EnrollmentDate |
|--------------|-----------|----------|----------------|
| 1            | 1         | 1        | 2023-09-01     |
| 2            | 2         | 2        | 2023-09-01     |
| 3            | 3         | 1        | 2023-09-01     |
| 4            | 1         | 3        | 2023-09-02     |
| 5            | 2         | 1        | 2023-09-02     |

#### 第3正規形（3NF）

第3正規形では、推移的関数従属を排除します。つまり、非キー属性が他の非キー属性に依存しないようにします。この場合、既に2NFにおいて学生情報とコース情報を分けているため、3NFも満たしています。

**Students テーブル:**

| StudentID | StudentName | StudentAddress |
|-----------|-------------|----------------|
| 1         | Alice       | 123 Maple St   |
| 2         | Bob         | 456 Oak St     |
| 3         | Charlie     | 789 Pine St    |

**Courses テーブル:**

| CourseID | CourseName  | Instructor   |
|----------|-------------|--------------|
| 1        | Math 101    | Dr. Smith    |
| 2        | History 201 | Dr. Brown    |
| 3        | Physics 301 | Dr. Johnson  |

**Enrollment テーブル:**

| EnrollmentID | StudentID | CourseID | EnrollmentDate |
|--------------|-----------|----------|----------------|
| 1            | 1         | 1        | 2023-09-01     |
| 2            | 2         | 2        | 2023-09-01     |
| 3            | 3         | 1        | 2023-09-01     |
| 4            | 1         | 3        | 2023-09-02     |
| 5            | 2         | 1        | 2023-09-02     |

これで、テーブルの正規化のプロセスとその結果について理解できるはずです。
