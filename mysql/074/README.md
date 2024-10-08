# No.074

あなたは、あるIT企業でプロジェクトの管理システムを担当しています。従業員は複数のプロジェクトに関わっており、それぞれのプロジェクトには複数のタスクが割り当てられています。各タスクの進捗状況と従業員ごとのプロジェクト貢献度を管理するために、複雑なクエリを作成します。

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
| 101       | Cloud Migration  |
| 102       | Website Redesign |
| 103       | AI Development   |

**Tasks テーブル:**

| TaskID | ProjectID | TaskName         | AssignedTo |
|--------|-----------|------------------|------------|
| 1001   | 101       | Set up VM        | 1          |
| 1002   | 101       | Data Migration   | 2          |
| 1003   | 102       | UI Design        | 3          |
| 1004   | 102       | Backend Dev      | 1          |
| 1005   | 103       | Model Training   | 2          |

**TaskStatus テーブル:**

| TaskID | Status        | LastUpdated     |
|--------|---------------|-----------------|
| 1001   | Completed     | 2024-10-01      |
| 1002   | In Progress   | 2024-10-02      |
| 1003   | In Progress   | 2024-10-03      |
| 1004   | Not Started   | NULL            |
| 1005   | Completed     | 2024-10-05      |
