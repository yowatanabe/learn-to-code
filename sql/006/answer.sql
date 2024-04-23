SELECT
  transaction_id,
  customer_id,
  amount,
  description
FROM
  transactions
WHERE
  transaction_date = '2023-09-01';
