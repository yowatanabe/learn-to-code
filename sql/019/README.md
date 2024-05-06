# No.019

`sales` テーブルには、各商品の売上データが含まれています。特定の商品カテゴリ（例えば、「Electronics」）の全商品の売上合計、平均売上、最高売上、最低売上を求めるSQLクエリを作成してください。

#### `sales` テーブル:

- `sale_id` (INT): 売上ID
- `product_name` (VARCHAR): 商品名
- `category` (VARCHAR): 商品カテゴリ
- `amount` (DECIMAL): 売上金額

#### 要件:

1. カテゴリ「Electronics」の商品についての集計情報を取得します。
2. 結果セットには売上合計、平均売上、最高売上、最低売上が含まれる必要があります。
