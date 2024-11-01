-- 確認
SELECT
  *
FROM
  Events;

SELECT
  *
FROM
  Participants;

-- トランザクションの開始
BEGIN;

-- 新しいイベント「Data Conference」を追加
INSERT INTO
  Events (EventID, EventName, Location)
VALUES
  (3, 'Data Conference', 'Kyoto');

-- エラーを引き起こすために存在しない EventID を使用
INSERT INTO
  Participants (ParticipantID, EventID, ParticipantName)
VALUES
  (3, 999, 'Charlie Brown');

-- エラーが発生したためロールバック
ROLLBACK;

-- 確認
SELECT
  *
FROM
  Events;

SELECT
  *
FROM
  Participants;

-- トランザクションの開始
BEGIN;

-- 新しいイベント「Data Conference」を追加
INSERT INTO
  Events (EventID, EventName, Location)
VALUES
  (3, 'Data Conference', 'Kyoto');

-- 新しいイベントの参加者を追加
INSERT INTO
  Participants (ParticipantID, EventID, ParticipantName)
VALUES
  (3, 3, 'Charlie Brown');

-- すべての操作が成功した場合のみコミット
COMMIT;

-- 確認
SELECT
  *
FROM
  Events;

SELECT
  *
FROM
  Participants;
