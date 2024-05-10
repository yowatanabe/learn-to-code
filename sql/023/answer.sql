SELECT
  product_name,
  SUM(amount) AS total_sales
FROM
  sales_data
GROUP BY
  product_name
HAVING
  SUM(amount) >= 500;
