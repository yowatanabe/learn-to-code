# No.024

`room_reservations` テーブルには、ホテルの客室予約の情報が含まれています。このテーブルから、特定の月（例：'2024-05'）に10回以上予約された客室タイプをリストするSQLクエリを作成してください。

#### `room_reservations` テーブル:

- `reservation_id` (INT): 予約ID
- `room_type` (VARCHAR): 客室タイプ（例：'Standard', 'Deluxe', 'Suite'）
- `reservation_date` (DATE): 予約日

#### 要件:

1. '2024-05'月に10回以上予約された客室タイプを抽出します。
2. 結果セットには客室タイプとその月の予約回数が含まれます。
