-- 1. 各顧客の総支払い金額を計算するクエリ (`SUM`)
SELECT
  Customers.CustomerName,
  SUM(Subscriptions.Amount) AS TotalPayment
FROM
  Customers
  JOIN Subscriptions ON Customers.CustomerID = Subscriptions.CustomerID
GROUP BY
  Customers.CustomerName;

-- 2. 各月ごとの総支払い金額を計算するクエリ (`SUM`)
SELECT
  DATE_FORMAT (PaymentDate, '%Y-%m') AS PaymentMonth,
  SUM(Amount) AS TotalPayment
FROM
  Subscriptions
GROUP BY
  PaymentMonth;

-- 3. 各顧客の支払い回数を計算するクエリ (`COUNT`)
SELECT
  Customers.CustomerName,
  COUNT(Subscriptions.SubscriptionID) AS PaymentCount
FROM
  Customers
  JOIN Subscriptions ON Customers.CustomerID = Subscriptions.CustomerID
GROUP BY
  Customers.CustomerName;
