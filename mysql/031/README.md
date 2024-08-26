# No.031

データベースの正規化について学ぶために、以下のシナリオに基づいてテーブルを設計し、データを正規化してください。特に、第1正規形（1NF）、第2正規形（2NF）、第3正規形（3NF）への変換を行います。

**シナリオ:**

あなたは小さなオンラインショップのデータベースを設計しています。初めに1つのテーブルを作成しましたが、データが冗長になっていることに気づきました。これを正規化していく手順を示してください。

**元のテーブル:**

**Orders テーブル:**

| OrderID | CustomerName | Product1 | Product2 | Product3 | TotalAmount | CustomerAddress |
|---------|--------------|----------|----------|----------|-------------|-----------------|
| 1       | Alice        | Laptop   | NULL     | NULL     | 1200.00     | 123 Main St     |
| 2       | Bob          | Smartphone| Tablet  | NULL     | 1400.00     | 456 Oak St      |
| 3       | Charlie      | Blender  | Coffee Maker| NULL   | 250.00      | 789 Pine St     |
