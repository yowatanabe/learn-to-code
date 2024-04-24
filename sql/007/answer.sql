SELECT
  c.name,
  c.email,
  o.order_date,
  o.amount
FROM
  customers c
  JOIN (
    SELECT
      customer_id,
      MAX(order_date) AS LatestOrderDate
    FROM
      orders
    GROUP BY
      customer_id
  ) lo ON c.customer_id = lo.customer_id
  JOIN orders o ON c.customer_id = o.customer_id
  AND lo.LatestOrderDate = o.order_date;
