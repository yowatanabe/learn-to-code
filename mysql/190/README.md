# No.190

プロジェクト情報を管理する `projects` テーブル と、各プロジェクトのタスク情報を管理する `tasks` テーブルがあります。

以下の要件を満たすテーブルを設計し、データを挿入してください：

1. `projects` テーブルにはプロジェクトの情報を格納し、`project_id` を主キーとします。
2. `tasks` テーブルにはプロジェクトに関連するタスク情報を格納し、`task_id` を主キー、`project_id` を外部キーとして設定します。
3. 外部キー制約により、存在しないプロジェクトにタスクを登録できないようにします。
4. プロジェクトが削除された場合、関連するタスクも削除されるようにします。

また、以下の質問に答えるクエリを作成してください：

1. プロジェクトごとのタスクリストを取得する。
2. プロジェクトが削除された場合、関連するタスクが削除されることを確認する。
