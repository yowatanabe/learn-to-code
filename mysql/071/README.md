# No.071

あなたは、eコマースサイトの注文管理システムを担当しています。注文、顧客、商品、配送状況を管理し、複数のテーブルを結合して、特定の条件に基づいたデータを抽出する必要があります。

### テーブル設計

**Customers テーブル:**

| CustomerID | CustomerName  |
|------------|---------------|
| 1          | Alice         |
| 2          | Bob           |
| 3          | Charlie       |

**Orders テーブル:**

| OrderID | CustomerID | OrderDate  |
|---------|------------|------------|
| 101     | 1          | 2024-10-01 |
| 102     | 2          | 2024-10-02 |
| 103     | 3          | 2024-10-03 |

**Products テーブル:**

| ProductID | ProductName   | Price |
|-----------|---------------|-------|
| 201       | Laptop        | 1000  |
| 202       | Smartphone    | 700   |
| 203       | Tablet        | 500   |

**OrderItems テーブル:**

| OrderItemID | OrderID | ProductID | Quantity |
|-------------|---------|-----------|----------|
| 301         | 101     | 201       | 1        |
| 302         | 101     | 202       | 2        |
| 303         | 102     | 203       | 1        |
| 304         | 103     | 201       | 1        |
| 305         | 103     | 202       | 1        |

**ShippingStatus テーブル:**

| OrderID | Status         |
|---------|----------------|
| 101     | Delivered      |
| 102     | Shipped        |
| 103     | Processing     |
