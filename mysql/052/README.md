# No.052

あなたはMySQLデータベースを使用して、顧客の注文情報を管理するためのテーブル`orders`を作成しました。テーブルの構造は以下の通りです。

```sql
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL
);
```

最近、以下のクエリの実行速度が遅いことが問題になっています。

```sql
SELECT order_id, order_date, total_amount
FROM orders
WHERE customer_id = 12345
AND status = 'Shipped'
ORDER BY order_date DESC
LIMIT 10;
```

1. **このクエリのパフォーマンスを最適化するために、どのようなインデックスを作成すればよいでしょうか？最適なインデックスを作成するSQL文を書いてください。**

2. **作成したインデックスが、このクエリの性能を向上させる理由を説明してください。**

3. **また、`status`が`'Shipped'`の注文に対して、日別の総売上を計算する以下のクエリがあります。このクエリを最適化するためのインデックスを作成するSQL文を書き、なぜそのインデックスが効果的か説明してください。**

```sql
SELECT order_date, SUM(total_amount) AS daily_sales
FROM orders
WHERE status = 'Shipped'
GROUP BY order_date;
```
