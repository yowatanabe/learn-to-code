# No.104

ユーザーが映画を予約するシステムで、異なるユーザーが同じ映画の予約を同時に行おうとする場合に、分離レベルが予約データに与える影響を確認します。

### テーブル設計

**Movies テーブル:**

| MovieID | MovieName        | AvailableSeats |
|---------|-------------------|----------------|
| 1       | Inception        | 5              |
| 2       | Interstellar     | 8              |
| 3       | The Dark Knight  | 10             |

**Bookings テーブル:**

| BookingID | MovieID | SeatsBooked | BookingDate |
|-----------|---------|-------------|-------------|
