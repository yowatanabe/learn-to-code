SELECT
  line_name,
  SUM(passenger_count) AS Total_Passengers,
  AVG(passenger_count) AS Average_Passengers,
  MAX(passenger_count) AS Max_Passengers,
  MIN(passenger_count) AS Min_Passengers
FROM
  transport_usage
GROUP BY
  line_name;
