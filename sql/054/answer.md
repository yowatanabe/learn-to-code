#### 第1正規形（1NF）

第1正規形では、各フィールドが単一の値を持つようにします。このテーブルは既に第1正規形に従っています。

**EmployeeProjects テーブル:**

| RecordID | EmployeeName | Department  | ProjectName | ProjectStartDate | HoursWorked |
|----------|--------------|-------------|-------------|------------------|-------------|
| 1        | John Doe     | IT          | Alpha       | 2024-01-01       | 150         |
| 2        | Jane Smith   | HR          | Beta        | 2024-02-15       | 120         |
| 3        | John Doe     | IT          | Gamma       | 2024-03-10       | 200         |
| 4        | Jane Smith   | HR          | Alpha       | 2024-04-05       | 100         |
| 5        | Jim Brown    | Marketing   | Beta        | 2024-05-20       | 180         |

#### 第2正規形（2NF）

第2正規形では、部分的関数従属を排除します。つまり、主キーの一部だけに依存する属性を別のテーブルに分けます。この場合、従業員情報とプロジェクト情報を分けます。

**Employees テーブル:**

| EmployeeID | EmployeeName | Department  |
|------------|--------------|-------------|
| 1          | John Doe     | IT          |
| 2          | Jane Smith   | HR          |
| 3          | Jim Brown    | Marketing   |

**Projects テーブル:**

| ProjectID | ProjectName | ProjectStartDate |
|-----------|-------------|------------------|
| 1         | Alpha       | 2024-01-01       |
| 2         | Beta        | 2024-02-15       |
| 3         | Gamma       | 2024-03-10       |

**EmployeeProjects テーブル:**

| RecordID | EmployeeID | ProjectID | HoursWorked |
|----------|------------|-----------|-------------|
| 1        | 1          | 1         | 150         |
| 2        | 2          | 2         | 120         |
| 3        | 1          | 3         | 200         |
| 4        | 2          | 1         | 100         |
| 5        | 3          | 2         | 180         |

#### 第3正規形（3NF）

第3正規形では、推移的関数従属を排除します。つまり、非キー属性が他の非キー属性に依存しないようにします。この場合、既に2NFにおいて従業員情報とプロジェクト情報を分けているため、3NFも満たしています。

**Employees テーブル:**

| EmployeeID | EmployeeName | Department  |
|------------|--------------|-------------|
| 1          | John Doe     | IT          |
| 2          | Jane Smith   | HR          |
| 3          | Jim Brown    | Marketing   |

**Projects テーブル:**

| ProjectID | ProjectName | ProjectStartDate |
|-----------|-------------|------------------|
| 1         | Alpha       | 2024-01-01       |
| 2         | Beta        | 2024-02-15       |
| 3         | Gamma       | 2024-03-10       |

**EmployeeProjects テーブル:**

| RecordID | EmployeeID | ProjectID | HoursWorked |
|----------|------------|-----------|-------------|
| 1        | 1          | 1         | 150         |
| 2        | 2          | 2         | 120         |
| 3        | 1          | 3         | 200         |
| 4        | 2          | 1         | 100         |
| 5        | 3          | 2         | 180         |

これで、テーブルの正規化のプロセスとその結果について理解できるはずです。
