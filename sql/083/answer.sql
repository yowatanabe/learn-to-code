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

-- トランザクションのコミット
COMMIT;
