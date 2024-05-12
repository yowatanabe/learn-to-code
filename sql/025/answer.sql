SELECT
  order_id
FROM
  order_details
WHERE
  dish_name = 'Pizza'
GROUP BY
  order_id
HAVING
  SUM(quantity) >= 3;
