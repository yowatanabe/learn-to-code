SELECT
  EXTRACT(
    YEAR
    FROM
      order_date
  ) AS order_year,
  EXTRACT(
    MONTH
    FROM
      order_date
  ) AS order_month,
  SUM(amount) AS total_sales
FROM
  orders
GROUP BY
  order_year,
  order_month
ORDER BY
  order_year,
  order_month;
