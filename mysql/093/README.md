# No.093

あなたは、ホテル予約システムのデータベース管理者です。システムには、ホテルの情報、予約の履歴、顧客の情報が含まれています。クエリの速度が重要となっているため、パフォーマンスの改善が求められています。

### テーブル設計

**Hotels テーブル:**

| HotelID | HotelName         | Location      | Rating |
|---------|-------------------|---------------|--------|
| 1       | Grand Hotel       | New York      | 5.0    |
| 2       | City Inn          | Los Angeles   | 4.3    |
| 3       | Beach Resort      | Miami         | 4.8    |
| 4       | Mountain Lodge    | Denver        | 4.5    |

**Bookings テーブル:**

| BookingID | HotelID | CheckInDate | CheckOutDate | NumberOfGuests | CustomerID |
|-----------|---------|-------------|--------------|----------------|------------|
| 101       | 1       | 2024-11-01  | 2024-11-05   | 2              | 1          |
| 102       | 2       | 2024-11-03  | 2024-11-06   | 3              | 2          |
| 103       | 3       | 2024-11-07  | 2024-11-10   | 4              | 3          |
| 104       | 1       | 2024-11-12  | 2024-11-15   | 1              | 4          |
| 105       | 4       | 2024-11-14  | 2024-11-18   | 5              | 2          |

**Customers テーブル:**

| CustomerID | CustomerName |
|------------|--------------|
| 1          | Sarah Jones  |
| 2          | Michael Lee  |
| 3          | Emma Brown   |
| 4          | David Smith  |
