SELECT
  SUM(amount) AS Total_Sales,
  AVG(amount) AS Average_Sales,
  MAX(amount) AS Max_Sale,
  MIN(amount) AS Min_Sale
FROM
  sales
WHERE
  category = 'Electronics';
