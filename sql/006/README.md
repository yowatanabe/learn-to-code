# No.006

オンラインショップのデータベース管理者であり、特定の日（例えば「2023-09-01」）に行われたすべてのトランザクションの詳細を抽出するSQLクエリを書く必要があります。

利用するテーブルは`transactions`で、以下のカラムが含まれます。

- `transaction_id`: トランザクションのID（主キー）
- `customer_id`: 顧客のID
- `transaction_date`: トランザクションの日付（YYYY-MM-DD形式）
- `amount`: トランザクションの金額
- `description`: トランザクションの説明
