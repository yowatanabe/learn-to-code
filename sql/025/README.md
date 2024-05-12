# No.025

`order_details` テーブルには、各注文の料理と注文量が記録されています。このテーブルから、「Pizza」を3回以上注文した注文番号を抽出するSQLクエリを作成してください。

#### `order_details` テーブル:

- `order_id` (INT): 注文番号
- `dish_name` (VARCHAR): 料理名
- `quantity` (INT): 注文数量

#### 要件:

1. 各注文で「Pizza」が注文された回数を集計します。
2. 「Pizza」が3回以上注文された注文番号のみを表示します。
