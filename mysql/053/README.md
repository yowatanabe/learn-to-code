# No.053

あなたは、オンライン小売店の注文管理システムを設計しています。注文情報に対して頻繁にクエリが実行されるため、最適なインデックス設計を行い、クエリパフォーマンスを改善する必要があります。

### テーブル設計

**Orders テーブル:**

| OrderID | CustomerName | OrderDate  | Status    | TotalAmount |
|---------|--------------|------------|-----------|-------------|
| 1       | Alice        | 2024-09-01 | Shipped   | 100.00      |
| 2       | Bob          | 2024-09-02 | Pending   | 200.00      |
| 3       | Charlie      | 2024-09-03 | Shipped   | 150.00      |
| 4       | David        | 2024-09-04 | Delivered | 300.00      |
| 5       | Eve          | 2024-09-05 | Pending   | 50.00       |