# No.120

顧客管理システムで、ストアドプロシージャを利用して特定の条件に基づいて顧客情報を更新する機能を実装します。このストアドプロシージャでは、顧客のメールアドレスとステータスを一括で更新します。

### テーブル設計

#### Customers テーブル

| CustomerID | CustomerName  | Email             | Status     |
|------------|---------------|-------------------|------------|
| 1          | Alice Smith   | alice@example.com | Active     |
| 2          | Bob Johnson   | bob@example.com   | Inactive   |
| 3          | Charlie Brown | charlie@example.com | Active |
