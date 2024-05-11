SELECT
  room_type,
  COUNT(*) AS reservation_count
FROM
  room_reservations
WHERE
  YEAR (reservation_date) = 2024
  AND MONTH (reservation_date) = 5
GROUP BY
  room_type
HAVING
  COUNT(*) >= 10;
