# No.091

あなたは、レストランの予約システムを管理しているデータベース管理者です。レストランの予約情報と顧客情報を持つテーブルがあり、クエリのパフォーマンスを改善する必要があります。特に、人気のあるレストランを効率よく特定するためのクエリを最適化します。

### テーブル設計

**Restaurants テーブル:**

| RestaurantID | RestaurantName    | CuisineType | Rating |
|--------------|-------------------|-------------|--------|
| 1            | Bella Italia      | Italian     | 4.5    |
| 2            | Sushi World       | Japanese    | 4.8    |
| 3            | Tacos Fiesta      | Mexican     | 4.2    |
| 4            | Curry Palace      | Indian      | 4.3    |

**Reservations テーブル:**

| ReservationID | RestaurantID | ReservationDate | NumberOfGuests |
|---------------|--------------|-----------------|----------------|
| 101           | 1            | 2024-10-01      | 5              |
| 102           | 2            | 2024-10-02      | 2              |
| 103           | 3            | 2024-10-02      | 4              |
| 104           | 1            | 2024-10-03      | 3              |
| 105           | 4            | 2024-10-04      | 6              |

**Customers テーブル:**

| CustomerID | CustomerName | PhoneNumber |
|------------|--------------|-------------|
| 1          | John Doe     | 555-1234    |
| 2          | Jane Smith   | 555-5678    |
| 3          | Mike Johnson | 555-8765    |
