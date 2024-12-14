# No.141

顧客情報を管理する `customers` テーブルと、注文情報を管理する `orders` テーブルがあります。

**要件**

1. クエリのパフォーマンスが低下しており、特定の**条件検索を高速化**する必要があります。
2. `customers` テーブルと `orders` テーブルを結合して、ある特定の顧客の注文履歴を検索するクエリを最適化してください。
3. **インデックスの追加、クエリの書き換え、EXPLAINの確認**を行い、**クエリのパフォーマンスを改善**してください。


以下のクエリを高速化してください。
このクエリは、**Bob の過去 1 年間の注文情報**を取得するものです。

```sql
SELECT c.customer_name, o.product_name, o.order_amount, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_name = 'Bob'
  AND o.order_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY o.order_date DESC;
```
