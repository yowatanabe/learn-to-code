# No.123

会社のプロジェクト管理システムでは、特定のプロジェクトに関連するすべてのタスクの進捗状況を集計するストアドプロシージャを作成しています。このストアドプロシージャを最適化し、効率的に動作するようにします。

### テーブル設計

#### Projects テーブル

| ProjectID | ProjectName  |
|-----------|--------------|
| 1         | Project A    |
| 2         | Project B    |
| 3         | Project C    |

#### Tasks テーブル

| TaskID | ProjectID | TaskName      | Progress |
|--------|-----------|---------------|----------|
| 1      | 1         | Design Phase  | 20       |
| 2      | 1         | Development   | 50       |
| 3      | 1         | Testing       | 70       |
| 4      | 2         | Documentation | 40       |
| 5      | 2         | Deployment    | 60       |
