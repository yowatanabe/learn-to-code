# No.099

以下のようなテーブルがあります。

**Employees テーブル:**

| EmployeeID | EmployeeName | DepartmentID |
|------------|--------------|--------------|
| 1          | Alice        | 1            |
| 2          | Bob          | 2            |
| 3          | Charlie      | 1            |
| 4          | David        | 3            |
| 5          | Eve          | 2            |

**Departments テーブル:**

| DepartmentID | DepartmentName |
|--------------|----------------|
| 1            | HR             |
| 2            | IT             |
| 3            | Finance        |

**Salaries テーブル:**

| SalaryID | EmployeeID | Salary  | PaymentDate |
|----------|------------|---------|-------------|
| 1        | 1          | 60000   | 2024-07-26  |
| 2        | 2          | 70000   | 2024-07-26  |
| 3        | 3          | 55000   | 2024-07-26  |
| 4        | 4          | 80000   | 2024-07-26  |
| 5        | 5          | 75000   | 2024-07-26  |

複数のテーブルからデータを結合する方法を示してください。以下のクエリを実行するSQL文を書いてください：

1. 各従業員の給与情報を含むレポートを作成し、従業員名、部署名、給与、および支払日を表示します。
2. 各部署ごとの総給与を表示します。