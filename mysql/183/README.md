# No.183

トレーニングプログラム情報を管理する `trainings` テーブル と、各プログラムに参加する従業員を管理する `training_attendance` テーブルがあります。

以下の要件を満たすテーブルを設計し、データを挿入してください：

1. `trainings` テーブルにはトレーニングプログラムの情報を格納し、`training_id` を主キーとします。
2. `training_attendance` テーブルにはトレーニングに参加した従業員の情報を格納し、`attendance_id` を主キー、`training_id` を外部キーとして設定します。
3. 外部キー制約により、存在しないトレーニングに従業員を登録できないようにします。

また、以下の質問に答えるクエリを作成してください：

1. 各トレーニングプログラムに参加している従業員一覧を取得する。
2. トレーニングプログラムが削除された場合、関連する出席データが削除されることを確認する。
