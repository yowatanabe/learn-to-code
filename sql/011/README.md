# No.011

あなたは人事部のデータベース管理者であり、`employees`テーブルから特定の部署（例えば、「Finance」）に所属する従業員のみの情報を取得する必要があります。データは、従業員のID、名前、給与、および部署を含む必要があります。

#### `employees` テーブル:

- `employee_id` (INT): 従業員のID
- `name` (VARCHAR): 従業員の名前
- `salary` (DECIMAL): 従業員の給与
- `department` (VARCHAR): 従業員の部署名


#### 要件:
1. `department`が「Finance」である従業員のみを選択します。
2. 結果セットには従業員のID、名前、給与、部署が含まれます。
