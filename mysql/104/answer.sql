-- `READ COMMITTED` での動作確認
-- `READ COMMITTED` 分離レベルでは、他のトランザクションのコミットした変更が反映されるため、予約状況がリアルタイムに変わる可能性があります。

-- セッション 1
-- READ COMMITTED の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;

-- Inception の空き座席を確認
SELECT
  AvailableSeats
FROM
  Movies
WHERE
  MovieID = 1;

-- ここでセッション 2 が座席予約を実行
UPDATE Movies
SET
  AvailableSeats = AvailableSeats - 2
WHERE
  MovieID = 1;

COMMIT;

-- セッション 2
BEGIN;

-- Inception の座席を 3 席予約
UPDATE Movies
SET
  AvailableSeats = AvailableSeats - 3
WHERE
  MovieID = 1;

INSERT INTO
  Bookings (MovieID, SeatsBooked, BookingDate)
VALUES
  (1, 3, CURDATE ());

COMMIT;

-- セッション1がコミットされる前にセッション2がコミットされると、同時実行により座席が二重に予約され、空き座席数が負になってしまうことがあります。
-- ステップ 3: `SERIALIZABLE` での動作確認
-- `SERIALIZABLE` 分離レベルで同様の操作を行います。このレベルではトランザクションが並行実行されず、座席数の一貫性が保たれます。

-- セッション 1
-- SERIALIZABLE の設定
SET
  SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

BEGIN;

-- Inception の空き座席を確認
SELECT
  AvailableSeats
FROM
  Movies
WHERE
  MovieID = 1;

-- セッション 2 の予約操作はここでブロックされる
UPDATE Movies
SET
  AvailableSeats = AvailableSeats - 2
WHERE
  MovieID = 1;

COMMIT;

-- セッション 2
BEGIN;

-- Inception の座席を 3 席予約（セッション 1 の完了を待機）
UPDATE Movies
SET
  AvailableSeats = AvailableSeats - 3
WHERE
  MovieID = 1;

INSERT INTO
  Bookings (MovieID, SeatsBooked, BookingDate)
VALUES
  (1, 3, CURDATE ());

COMMIT;
