-- `EXISTS` を使用。参加者が存在するイベントのみを表示。
SELECT
  EventName
FROM
  Events e
WHERE
  EXISTS (
    SELECT
      1
    FROM
      Participants p
    WHERE
      p.EventID = e.EventID
  );

-- `IN` を使用。参加者がいるイベントの名前を取得。
SELECT
  EventName
FROM
  Events
WHERE
  EventID IN (
    SELECT
      EventID
    FROM
      Participants
    WHERE
      EventID IN (1, 2)
  );

-- `ANY` を使用。ある参加者の登録日が最も早いイベントを表示。
SELECT
  EventName
FROM
  Events
WHERE
  EventID = ANY (
    SELECT
      EventID
    FROM
      Participants
    WHERE
      RegistrationDate < '2024-09-28'
  );
