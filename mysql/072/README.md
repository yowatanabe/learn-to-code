# No.072

あなたは、従業員のプロジェクト参加状況とその成果を管理するシステムを担当しています。従業員、プロジェクト、タスク、そしてそれぞれのタスクの進捗を追跡するために、複雑なクエリを実行する必要があります。

### テーブル設計

**Employees テーブル:**

| EmployeeID | EmployeeName  |
|------------|---------------|
| 1          | Alice         |
| 2          | Bob           |
| 3          | Charlie       |

**Projects テーブル:**

| ProjectID | ProjectName      |
|-----------|------------------|
| 101       | Website Redesign |
| 102       | App Development  |
| 103       | Database Upgrade |

**Tasks テーブル:**

| TaskID | ProjectID | TaskName         | AssignedTo |
|--------|-----------|------------------|------------|
| 1001   | 101       | Frontend Design  | 1          |
| 1002   | 101       | Backend Setup    | 2          |
| 1003   | 102       | API Development  | 3          |
| 1004   | 103       | DB Schema Design | 2          |
| 1005   | 103       | Performance Test | 1          |

**TaskStatus テーブル:**

| TaskID | Status        | CompletionDate |
|--------|---------------|----------------|
| 1001   | Completed     | 2024-10-01     |
| 1002   | In Progress   | NULL           |
| 1003   | Completed     | 2024-10-10     |
| 1004   | In Progress   | NULL           |
| 1005   | Not Started   | NULL           |
