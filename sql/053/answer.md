#### 第1正規形（1NF）

第1正規形では、各フィールドが単一の値を持つようにします。このテーブルは既に第1正規形に従っています。

**Sales テーブル:**

| SaleID | ProductName   | CustomerName | CustomerAddress  | SaleDate   | SaleAmount |
|--------|---------------|--------------|------------------|------------|------------|
| 1      | Laptop        | Alice        | 123 Maple St     | 2024-01-15 | 1000       |
| 2      | Mouse         | Bob          | 456 Oak St       | 2024-02-10 | 20         |
| 3      | Laptop        | Charlie      | 789 Pine St      | 2024-03-05 | 1000       |
| 4      | Keyboard      | Alice        | 123 Maple St     | 2024-01-25 | 50         |
| 5      | Monitor       | Bob          | 456 Oak St       | 2024-02-20 | 200        |

#### 第2正規形（2NF）

第2正規形では、部分的関数従属を排除します。つまり、主キーの一部だけに依存する属性を別のテーブルに分けます。この場合、顧客情報と製品情報を分けます。

**Customers テーブル:**

| CustomerID | CustomerName | CustomerAddress |
|------------|--------------|-----------------|
| 1          | Alice        | 123 Maple St    |
| 2          | Bob          | 456 Oak St      |
| 3          | Charlie      | 789 Pine St     |

**Products テーブル:**

| ProductID | ProductName |
|-----------|-------------|
| 1         | Laptop      |
| 2         | Mouse       |
| 3         | Keyboard    |
| 4         | Monitor     |

**Sales テーブル:**

| SaleID | ProductID | CustomerID | SaleDate   | SaleAmount |
|--------|-----------|------------|------------|------------|
| 1      | 1         | 1          | 2024-01-15 | 1000       |
| 2      | 2         | 2          | 2024-02-10 | 20         |
| 3      | 1         | 3          | 2024-03-05 | 1000       |
| 4      | 3         | 1          | 2024-01-25 | 50         |
| 5      | 4         | 2          | 2024-02-20 | 200        |

#### 第3正規形（3NF）

第3正規形では、推移的関数従属を排除します。つまり、非キー属性が他の非キー属性に依存しないようにします。この場合、既に2NFにおいて顧客情報と製品情報を分けているため、3NFも満たしています。

**Customers テーブル:**

| CustomerID | CustomerName | CustomerAddress |
|------------|--------------|-----------------|
| 1          | Alice        | 123 Maple St    |
| 2          | Bob          | 456 Oak St      |
| 3          | Charlie      | 789 Pine St     |

**Products テーブル:**

| ProductID | ProductName |
|-----------|-------------|
| 1         | Laptop      |
| 2         | Mouse       |
| 3         | Keyboard    |
| 4         | Monitor     |

**Sales テーブル:**

| SaleID | ProductID | CustomerID | SaleDate   | SaleAmount |
|--------|-----------|------------|------------|------------|
| 1      | 1         | 1          | 2024-01-15 | 1000       |
| 2      | 2         | 2          | 2024-02-10 | 20         |
| 3      | 1         | 3          | 2024-03-05 | 1000       |
| 4      | 3         | 1          | 2024-01-25 | 50         |
| 5      | 4         | 2          | 2024-02-20 | 200        |

これで、テーブルの正規化のプロセスとその結果について理解できるはずです。
