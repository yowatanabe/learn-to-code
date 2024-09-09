-- インデックスの作成
-- 多くのクエリで `DepartureCity` や `ArrivalCity` でフライトを検索することが予想されるためこれらの列にインデックスを作成
CREATE INDEX idx_departure_city ON Flights (DepartureCity);

CREATE INDEX idx_arrival_city ON Flights (ArrivalCity);

-- インデックスを使用したクエリ
SELECT
  FlightNumber,
  DepartureCity,
  ArrivalCity,
  DepartureDate
FROM
  Flights
WHERE
  DepartureCity = 'New York';

-- インデックスの確認
SHOW INDEX
FROM
  Flights;
