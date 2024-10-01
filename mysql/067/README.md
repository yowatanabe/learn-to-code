# No.067

あなたは、社員とプロジェクトを管理している会社のシステムを担当しています。社員がどのプロジェクトに参加しているか、または参加していないかを確認するため、様々な結合を使用します。

### テーブル設計

**Employees テーブル:**

| EmployeeID | EmployeeName |
|------------|--------------|
| 1          | Alice        |
| 2          | Bob          |
| 3          | Charlie      |

**Projects テーブル:**

| ProjectID | ProjectName | EmployeeID |
|-----------|-------------|------------|
| 1         | Project A   | 1          |
| 2         | Project B   | 2          |
| 3         | Project C   | NULL       |
