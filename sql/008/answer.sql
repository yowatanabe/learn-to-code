SELECT
  CASE
    WHEN HOUR (transaction_time) < 12 THEN 'Morning'
    WHEN HOUR (transaction_time) < 18 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day,
  COUNT(*) AS transaction_count,
  SUM(amount) AS total_amount
FROM
  transactions
WHERE
  DATE (transaction_time) = '2024-04-26'
GROUP BY
  time_of_day;
