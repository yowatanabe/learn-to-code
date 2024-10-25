-- パフォーマンスが低いクエリの例
SELECT
  Restaurants.RestaurantName,
  COUNT(Reservations.ReservationID) AS TotalReservations,
  SUM(Reservations.NumberOfGuests) AS TotalGuests
FROM
  Restaurants
  JOIN Reservations ON Restaurants.RestaurantID = Reservations.RestaurantID
GROUP BY
  Restaurants.RestaurantName;

-- `EXPLAIN` を使用してクエリの解析
EXPLAIN
SELECT
  Restaurants.RestaurantName,
  COUNT(Reservations.ReservationID) AS TotalReservations,
  SUM(Reservations.NumberOfGuests) AS TotalGuests
FROM
  Restaurants
  JOIN Reservations ON Restaurants.RestaurantID = Reservations.RestaurantID
GROUP BY
  Restaurants.RestaurantName;

-- インデックスを作成してクエリを最適化
CREATE INDEX idx_restaurant_id ON Reservations (RestaurantID);

-- インデックスを使った最適化クエリ
SELECT
  Restaurants.RestaurantName,
  COUNT(Reservations.ReservationID) AS TotalReservations,
  SUM(Reservations.NumberOfGuests) AS TotalGuests
FROM
  Restaurants
  JOIN Reservations ON Restaurants.RestaurantID = Reservations.RestaurantID
GROUP BY
  Restaurants.RestaurantName;

-- `EXPLAIN ANALYZE` を使用して実行時間の確認
EXPLAIN ANALYZE
SELECT
  Restaurants.RestaurantName,
  COUNT(Reservations.ReservationID) AS TotalReservations,
  SUM(Reservations.NumberOfGuests) AS TotalGuests
FROM
  Restaurants
  JOIN Reservations ON Restaurants.RestaurantID = Reservations.RestaurantID
GROUP BY
  Restaurants.RestaurantName\G
