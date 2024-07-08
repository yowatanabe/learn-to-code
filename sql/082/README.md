# No.082

以下のようなテーブルがあります。

**Inventory テーブル:**

| ProductID | ProductName | Stock |
|-----------|-------------|-------|
| 1         | Laptop      | 10    |
| 2         | Mouse       | 50    |
| 3         | Keyboard    | 30    |

**Orders テーブル:**

| OrderID | ProductID | Quantity |
|---------|-----------|----------|
| 1       | 1         | 2        |
| 2       | 2         | 5        |

新しい注文を追加し、在庫を減らすトランザクションを実行するSQL文を書いてください。
