# No.031

以下の2つのテーブルがあります。

**Employees テーブル:**

| EmployeeID | Name       | DepartmentID | Salary |
|------------|------------|--------------|--------|
| 1          | Alice      | 1            | 60000  |
| 2          | Bob        | 2            | 50000  |
| 3          | Charlie    | 1            | 70000  |
| 4          | David      | 3            | 45000  |
| 5          | Eve        | 2            | 65000  |

**Departments テーブル:**

| DepartmentID | DepartmentName |
|--------------|----------------|
| 1            | HR             |
| 2            | IT             |
| 3            | Finance        |

以下の条件を満たすサブクエリを使用したSQLクエリを作成してください：

1. 各部門の平均給与を計算し、それより高い給与を持つ従業員の名前と給与を表示。
2. 上記の結果に部門名も追加。