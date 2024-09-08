-- インデックスの作成
-- 予約システムでは、`ReservationDate`に基づいて予約情報を頻繁に検索するためこの列にインデックスを作成
CREATE INDEX idx_reservation_date ON Reservations (ReservationDate);

-- インデックスを使用したクエリ
SELECT
  ReservationID,
  CustomerName,
  PartySize
FROM
  Reservations
WHERE
  ReservationDate = '2024-09-09';

-- インデックスの確認
SHOW INDEX
FROM
  Reservations;
