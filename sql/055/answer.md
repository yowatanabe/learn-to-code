#### 第1正規形（1NF）

第1正規形では、各フィールドが単一の値を持つようにします。このテーブルは既に第1正規形に従っています。

**Orders テーブル:**

| OrderID | CustomerName | CustomerAddress | ProductName | Quantity | OrderDate   |
|---------|--------------|-----------------|-------------|----------|-------------|
| 1       | Alice        | 123 Maple St    | Laptop      | 1        | 2024-01-15  |
| 2       | Bob          | 456 Oak St      | Mouse       | 2        | 2024-02-10  |
| 3       | Alice        | 123 Maple St    | Keyboard    | 1        | 2024-03-05  |
| 4       | Charlie      | 789 Pine St     | Monitor     | 1        | 2024-01-25  |
| 5       | Bob          | 456 Oak St      | Laptop      | 1        | 2024-02-20  |

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

**Orders テーブル:**

| OrderID | CustomerID | ProductID | Quantity | OrderDate   |
|---------|------------|-----------|----------|-------------|
| 1       | 1          | 1         | 1        | 2024-01-15  |
| 2       | 2          | 2         | 2        | 2024-02-10  |
| 3       | 1          | 3         | 1        | 2024-03-05  |
| 4       | 3          | 4         | 1        | 2024-01-25  |
| 5       | 2          | 1         | 1        | 2024-02-20  |

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

**Orders テーブル:**

| OrderID | CustomerID | ProductID | Quantity | OrderDate   |
|---------|------------|-----------|----------|-------------|
| 1       | 1          | 1         | 1        | 2024-01-15  |
| 2       | 2          | 2         | 2        | 2024-02-10  |
| 3       | 1          | 3         | 1        | 2024-03-05  |
| 4       | 3          | 4         | 1        | 2024-01-25  |
| 5       | 2          | 1         | 1        | 2024-02-20  |
