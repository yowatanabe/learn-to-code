# No.069

あなたは、会社の従業員と部門の情報を管理するデータベースを持っています。従業員が所属する部門と、所属していない従業員のデータを確認するために、結合を使用します。

### テーブル設計

**Employees テーブル:**

| EmployeeID | EmployeeName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |
| 4          | David        |

**Departments テーブル:**

| DepartmentID | DepartmentName | EmployeeID |
|--------------|----------------|------------|
| 1            | HR             | 1          |
| 2            | IT             | 2          |
| 3            | Finance        | NULL       |
