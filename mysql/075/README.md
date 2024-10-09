# No.075

あなたは、プロジェクト管理システムを担当しています。従業員は複数のプロジェクトに参加しており、それぞれのプロジェクトにはタスクが割り当てられています。プロジェクトの予算、タスクの進行状況、従業員の担当状況を確認するために、複雑なクエリを作成する必要があります。

### テーブル設計

**Employees テーブル:**

| EmployeeID | EmployeeName  |
|------------|---------------|
| 1          | Alice         |
| 2          | Bob           |
| 3          | Charlie       |

**Projects テーブル:**

| ProjectID | ProjectName       | Budget   |
|-----------|-------------------|----------|
| 101       | Cloud Migration   | 1000000  |
| 102       | Website Redesign  | 500000   |
| 103       | AI Development    | 2000000  |

**Tasks テーブル:**

| TaskID | ProjectID | TaskName         | AssignedTo |
|--------|-----------|------------------|------------|
| 1001   | 101       | VM Setup         | 1          |
| 1002   | 101       | Data Transfer    | 2          |
| 1003   | 102       | Frontend Design  | 3          |
| 1004   | 102       | Backend Setup    | 1          |
| 1005   | 103       | Model Training   | 2          |

**TaskStatus テーブル:**

| TaskID | Status        | LastUpdated     |
|--------|---------------|-----------------|
| 1001   | Completed     | 2024-10-01      |
| 1002   | In Progress   | 2024-10-05      |
| 1003   | Not Started   | NULL            |
| 1004   | In Progress   | 2024-10-07      |
| 1005   | Completed     | 2024-10-10      |
