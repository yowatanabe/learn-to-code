-- パフォーマンスが低いクエリの例
SELECT
  Hotels.HotelName,
  COUNT(Bookings.BookingID) AS TotalBookings,
  SUM(Bookings.NumberOfGuests) AS TotalGuests
FROM
  Hotels
  JOIN Bookings ON Hotels.HotelID = Bookings.HotelID
GROUP BY
  Hotels.HotelName;

-- `EXPLAIN` を使用してクエリの解析
EXPLAIN
SELECT
  Hotels.HotelName,
  COUNT(Bookings.BookingID) AS TotalBookings,
  SUM(Bookings.NumberOfGuests) AS TotalGuests
FROM
  Hotels
  JOIN Bookings ON Hotels.HotelID = Bookings.HotelID
GROUP BY
  Hotels.HotelName;

-- インデックスを使用した最適化
CREATE INDEX idx_hotel_id ON Bookings (HotelID);

-- インデックスを活用した最適化クエリ
SELECT
  Hotels.HotelName,
  COUNT(Bookings.BookingID) AS TotalBookings,
  SUM(Bookings.NumberOfGuests) AS TotalGuests
FROM
  Hotels
  JOIN Bookings ON Hotels.HotelID = Bookings.HotelID
GROUP BY
  Hotels.HotelName;

-- `EXPLAIN ANALYZE` を使用して実行プランの分析
EXPLAIN ANALYZE
SELECT
  Hotels.HotelName,
  COUNT(Bookings.BookingID) AS TotalBookings,
  SUM(Bookings.NumberOfGuests) AS TotalGuests
FROM
  Hotels
  JOIN Bookings ON Hotels.HotelID = Bookings.HotelID
GROUP BY
  Hotels.HotelName\G
