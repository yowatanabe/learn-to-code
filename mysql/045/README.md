# No.045

あなたは、航空会社のフライト予約システムを設計しています。このシステムでは、顧客が予約したフライト情報を管理し、検索クエリのパフォーマンスを最適化するためにインデックスを使用します。

### テーブル設計

**Flights テーブル:**

| FlightID | FlightNumber | DepartureCity | ArrivalCity | DepartureDate | ArrivalDate |
|----------|--------------|---------------|-------------|---------------|-------------|
| 1        | AA123        | New York      | Los Angeles | 2024-09-01    | 2024-09-01  |
| 2        | AA124        | New York      | Chicago     | 2024-09-02    | 2024-09-02  |
| 3        | BA201        | London        | New York    | 2024-09-03    | 2024-09-03  |
| 4        | JL456        | Tokyo         | New York    | 2024-09-04    | 2024-09-04  |
| 5        | SQ789        | Singapore     | Tokyo       | 2024-09-05    | 2024-09-05  |
