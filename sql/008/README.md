# No.008

ある企業のEコマースプラットフォームから収集されたトランザクションデータを分析する任務を担っています。`transactions` テーブルを使用して、特定の日（例えば「2024-04-26」）における時間帯別（午前、午後、夜間）のトランザクション数と合計金額を計算するSQLクエリを作成してください。

#### `transactions` テーブル:
- `transaction_id` (INT): トランザクションのID（主キー）
- `transaction_time` (DATETIME): トランザクションの日時
- `amount` (DECIMAL): トランザクションの金額

#### 時間帯定義:
- 午前: 00:00 - 11:59
- 午後: 12:00 - 17:59
- 夜間: 18:00 - 23:59

#### 要件:
1. トランザクション数と合計金額を時間帯別に集計します。
2. 結果セットには時間帯とその時間帯のトランザクション数、合計金額が含まれる必要があります。
