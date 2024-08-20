-- 金額が100以上のトランザクションを選択
SELECT
  *
FROM
  Transactions
WHERE
  Amount >= 100;

-- 支払い方法がCredit Cardで、金額が200以下のトランザクションを選択
SELECT
  *
FROM
  Transactions
WHERE
  PaymentMethod = 'Credit Card'
  AND Amount <= 200;

-- トランザクションが7月2日以降の日付で行われたものを選択
SELECT
  *
FROM
  Transactions
WHERE
  TransactionDate >= '2024-08-02';

-- 顧客名に「a」を含むトランザクションを選択
SELECT
  *
FROM
  Transactions
WHERE
  CustomerName LIKE '%a%';
