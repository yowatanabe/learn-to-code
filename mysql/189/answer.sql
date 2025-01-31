-- 1. 出張ごとの参加者リストを取得するクエリ
SELECT
    t.destination,
    t.purpose,
    p.employee_name,
    p.department,
    p.role
FROM
    business_trips t
    JOIN trip_participants p ON t.trip_id = p.trip_id
ORDER BY
    t.destination,
    p.role;

-- 2. 出張削除後の参加者情報確認クエリ
-- 出張 "New York" を削除
DELETE FROM business_trips
WHERE
    destination = 'New York';

-- 残っている参加者情報を確認
SELECT
    *
FROM
    trip_participants;
