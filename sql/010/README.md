# No.010

データベース内のユーザーテーブルから特定の月に生まれたユーザーを検索し、その情報を取得します。このようなクエリは、マーケティングキャンペーンやユーザーアナリティクスで役立ちます。

`users`テーブルには以下のカラムが含まれています:

- `user_id` (INT): ユーザーID
- `first_name` (VARCHAR): ユーザーの名前
- `last_name` (VARCHAR): ユーザーの姓
- `birthdate` (DATE): ユーザーの誕生日

9月に生まれたすべてのユーザーのID、名前、姓を取得するSQLクエリを作成してください。