# No.157

講座情報を管理する `courses` テーブル と、受講履歴を管理する `enrollments` テーブルがあります。

**要件**

1. **`courses` テーブルに主キーを設定**して、各講座を一意に識別します。
2. **`enrollments` テーブルに外部キーを設定**して、受講履歴が正しい講座情報と関連付けられるようにします。
3. 次の質問に答えるSQLクエリを作成してください。
   - **各講座の受講者数を集計**するクエリ。
   - 存在しない講座IDを `enrollments` テーブルに登録しようとした場合、どのようなエラーが発生するか説明し、外部キー制約の重要性を解説してください。
