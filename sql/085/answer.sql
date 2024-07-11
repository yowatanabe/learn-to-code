-- トランザクションの開始
START TRANSACTION;

-- Aliceの口座から200を減額
UPDATE Accounts
SET
  Balance = Balance - 200
WHERE
  AccountID = 1;

-- Bobの口座に200を増額
UPDATE Accounts
SET
  Balance = Balance + 200
WHERE
  AccountID = 2;

-- 取引の追加
INSERT INTO
  Transactions (TransactionID, AccountID, Amount, TransactionDate)
VALUES
  (3, 1, -200, '2024-07-13'),
  (4, 2, 200, '2024-07-13');

-- トランザクションのコミット
COMMIT;
