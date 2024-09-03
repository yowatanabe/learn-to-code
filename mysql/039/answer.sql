-- 予約された部屋と顧客の情報を取得するクエリ
SELECT
  Customers.CustomerName,
  Rooms.RoomType,
  Bookings.CheckInDate,
  Bookings.CheckOutDate
FROM
  Bookings
  JOIN Customers ON Bookings.CustomerID = Customers.CustomerID
  JOIN Rooms ON Bookings.RoomID = Rooms.RoomID;
