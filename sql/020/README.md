# No.020

`transport_usage` テーブルには、バスとトラムの路線ごとの乗客数が含まれています。このテーブルから、各路線の総乗客数、平均乗客数、最高乗客数、および最低乗客数を取得するSQLクエリを作成してください。

#### `transport_usage` テーブル:

- `usage_id` (INT): 使用記録のID
- `line_name` (VARCHAR): 路線名
- `vehicle_type` (VARCHAR): 交通機関の種類（'Bus' または 'Tram'）
- `passenger_count` (INT): 乗客数

#### 要件:

1. 路線ごとに乗客数の総数、平均数、最大数、最小数を集計します。
2. 結果セットは路線名と各集約値を含む必要があります。
