-- 非効率なクエリ
SELECT e.event_name,
       COUNT(a.attendee_id) AS total_attendees
FROM events e
JOIN attendees a ON e.event_id = a.event_id
WHERE a.registration_date >= CURDATE() - INTERVAL 60 DAY
GROUP BY e.event_id
ORDER BY total_attendees DESC
LIMIT 5;

-- EXPLAINの確認（非効率な状態）
EXPLAIN
SELECT e.event_name,
       COUNT(a.attendee_id) AS total_attendees
FROM events e
JOIN attendees a ON e.event_id = a.event_id
WHERE a.registration_date >= CURDATE() - INTERVAL 60 DAY
GROUP BY e.event_id
ORDER BY total_attendees DESC
LIMIT 5;

-- インデックスの最適化
ALTER TABLE attendees
ADD INDEX idx_registration_date_event (registration_date, event_id);

-- EXPLAINの確認（最適化後）
EXPLAIN
SELECT e.event_name,
       COUNT(a.attendee_id) AS total_attendees
FROM events e
JOIN attendees a ON e.event_id = a.event_id
WHERE a.registration_date >= CURDATE() - INTERVAL 60 DAY
GROUP BY e.event_id
ORDER BY total_attendees DESC
LIMIT 5;
