# No.061

あなたは、ソフトウェア会社のプロジェクト管理システムを運営しています。このシステムには、プロジェクトごとのタスク情報が保存されており、特定の条件に基づいてクエリを実行してデータを取得します。

### テーブル設計

**Projects テーブル:**

| ProjectID | ProjectName |
|-----------|-------------|
| 1         | Alpha       |
| 2         | Beta        |
| 3         | Gamma       |

**Tasks テーブル:**

| TaskID | ProjectID | TaskName       | HoursWorked |
|--------|-----------|----------------|-------------|
| 1      | 1         | Design         | 10          |
| 2      | 1         | Development    | 20          |
| 3      | 2         | Testing        | 15          |
| 4      | 3         | Documentation  | 8           |
| 5      | 3         | Review         | 5           |
