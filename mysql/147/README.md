# No.147

学生情報を管理する `students` テーブル と、成績履歴を管理する `grades` テーブルがあります。

**要件:**

1. 過去30日以内に評価された成績データの中で、**最も高い平均点を持つ上位5名の学生**を取得するクエリを作成してください。
2. 初期状態では、テーブルにインデックスがほとんど設定されていないため、クエリ実行時に全表走査（ALLスキャン）が発生し、パフォーマンスが悪い状況を想定します。
3. **EXPLAIN**で現状を把握した後、**インデックスの最適化と管理**によってパフォーマンスを向上させてください。
