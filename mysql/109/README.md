# No.109

ユーザーが複数の商品を一度に購入する際、在庫を減らし、注文履歴を一括で保存する処理を効率的に行います。これにより、ロックの競合を防ぎ、トランザクション処理のスループットを向上させます。

### テーブル設計

**Products テーブル:**

| ProductID | ProductName | Stock |
|-----------|-------------|-------|
| 1         | TV          | 15    |
| 2         | Laptop      | 10    |
| 3         | Smartphone  | 20    |

**Orders テーブル:**

| OrderID | ProductID | Quantity | OrderDate  |
|---------|-----------|----------|------------|
