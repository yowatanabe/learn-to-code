# No.197

商品情報を管理する `products` テーブル と、売上情報を管理する `sales` テーブルがあります。

以下の要件を満たすクエリを作成してください：

1. `products` テーブルには商品情報を格納し、`product_id` を主キーとします。
2. `sales` テーブルには商品の売上情報を格納し、`sale_id` を主キー、`product_id` を外部キーとして設定します。
3. **サブクエリ** を使用して、**最も売上金額が高い商品を取得するクエリ**を作成してください。
