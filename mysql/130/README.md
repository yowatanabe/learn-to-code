# No.130

在庫管理システムにおいて、`Inventory`テーブルの在庫数が変更されるたびに、その変更履歴を`InventoryLog`テーブルに自動記録するトリガーを作成してください。

### テーブル設計

#### Inventory テーブル

| ProductID | ProductName  | Stock |
|-----------|--------------|-------|
| 1         | Smartphone   | 50    |
| 2         | Laptop       | 20    |
| 3         | Headphones   | 100   |

#### InventoryLog テーブル

| LogID | ProductID | OldStock | NewStock | ChangeDate          |
|-------|-----------|----------|----------|---------------------|
| 1     | 1         | 50       | 45       | 2024-12-04 10:00:00 |
