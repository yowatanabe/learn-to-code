# No.023

`sales_data` テーブルには、カフェの各商品ごとの日別売上情報が含まれています。このテーブルから、総売上が$500以上の商品のみをリストし、それぞれの商品名と総売上を表示するSQLクエリを作成してください。

#### `sales_data` テーブル:

- `sale_id` (INT): 売上ID
- `product_name` (VARCHAR): 商品名
- `sale_date` (DATE): 売上日
- `amount` (DECIMAL): 売上金額

#### 要件:

1. 各商品の総売上を集計します。
2. 総売上が$500以上の商品のみを表示します。
3. 結果セットには商品名とその総売上が含まれる必要があります。
