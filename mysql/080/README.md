# No.080

あなたは、ある出版社の書籍販売管理システムを担当しています。書籍の販売数、価格、注文数などを管理し、集計関数を使用して売上や販売状況を分析します。

### テーブル設計

**Books テーブル:**

| BookID | BookTitle      | Price  |
|--------|----------------|--------|
| 1      | Learn SQL      | 2000   |
| 2      | Mastering MySQL| 3000   |
| 3      | Advanced SQL   | 2500   |

**Sales テーブル:**

| SaleID | BookID | Quantity | SaleDate   |
|--------|--------|----------|------------|
| 101    | 1      | 3        | 2024-10-01 |
| 102    | 2      | 5        | 2024-10-02 |
| 103    | 1      | 2        | 2024-10-03 |
| 104    | 3      | 4        | 2024-10-04 |
| 105    | 2      | 1        | 2024-10-05 |