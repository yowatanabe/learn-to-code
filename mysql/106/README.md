# No.106

ショッピングサイトのカート内で複数の商品の在庫を一括で減算し、注文履歴に一括で挿入します。個別に更新するのではなく、まとめて処理することでパフォーマンスの向上を目指します。

### テーブル設計

**Products テーブル:**

| ProductID | ProductName | Stock |
|-----------|-------------|-------|
| 1         | Laptop      | 20    |
| 2         | Mouse       | 100   |
| 3         | Keyboard    | 50    |

**Orders テーブル:**

| OrderID | ProductID | Quantity | OrderDate  |
|---------|-----------|----------|------------|
