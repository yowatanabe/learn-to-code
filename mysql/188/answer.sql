-- 1. 各研修の参加者リストを取得するクエリ
SELECT
    t.training_name,
    t.instructor,
    p.employee_name,
    p.department,
    p.registration_date
FROM
    trainings t
    JOIN training_participants p ON t.training_id = p.training_id
ORDER BY
    t.training_name,
    p.registration_date;

-- 2. 研修削除後の参加者情報確認クエリ
-- 研修 "AWS Security Best Practices" を削除
DELETE FROM trainings
WHERE
    training_name = 'AWS Security Best Practices';

-- 残っている参加者情報を確認
SELECT
    *
FROM
    training_participants;
