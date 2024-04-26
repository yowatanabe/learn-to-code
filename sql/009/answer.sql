SELECT
  p.category,
  p.product_name,
  p.units_sold
FROM
  products p
  INNER JOIN (
    SELECT
      category,
      MAX(units_sold) AS max_units_sold
    FROM
      products
    GROUP BY
      category
  ) m ON p.category = m.category
  AND p.units_sold = m.max_units_sold;
