# No.002

```sql
SELECT *
FROM orders
WHERE order_date >= '2023-01-10'
ORDER BY customer_id;
```

このクエリは、`orders`テーブルから2023年1月10日以降に行われた注文を取得していますが実行が遅くなってしまっています。

※`orders`テーブルの各データは[init.sql](init.sql)を参照

インデックスでスロークエリを修正してください。
