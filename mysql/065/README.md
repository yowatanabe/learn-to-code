# No.065

あなたは、IT会社のプロジェクト管理システムを担当しています。プロジェクトごとにタスクと担当者が割り当てられており、これを元にデータの抽出を行います。

### テーブル設計

**Projects テーブル:**

| ProjectID | ProjectName      |
|-----------|------------------|
| 1         | Web Development  |
| 2         | Data Migration   |
| 3         | Mobile App       |

**Tasks テーブル:**

| TaskID | ProjectID | TaskName           | HoursSpent |
|--------|-----------|--------------------|------------|
| 1      | 1         | Frontend Design    | 20         |
| 2      | 1         | Backend Integration| 25         |
| 3      | 2         | Database Setup     | 15         |
| 4      | 3         | UI Testing         | 10         |
| 5      | 3         | API Development    | 30         |
