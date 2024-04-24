# No.007

顧客情報が格納された`customers`テーブルと、注文情報が格納された`orders`テーブルを扱います。各顧客の最新の注文情報とともに顧客の名前とEメールアドレスを取得するSQLクエリを作成してください。

#### `customers` テーブル:
- `customer_id` (INT): 顧客ID（主キー）
- `name` (VARCHAR): 顧客の名前
- `email` (VARCHAR): 顧客のメールアドレス

#### `orders` テーブル:
- `order_id` (INT): 注文ID（主キー）
- `customer_id` (INT): 顧客ID（外部キー）
- `order_date` (DATE): 注文日
- `amount` (DECIMAL): 注文額

#### 要件:
1. 顧客の名前とEメールアドレスを取得します。
2. 各顧客の最新の注文日と注文額を取得します。
