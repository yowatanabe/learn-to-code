-- 1. 各トレーニングプログラムに参加している従業員一覧を取得するクエリ
SELECT
    t.training_name,
    a.employee_name,
    a.role,
    a.attendance_date
FROM
    trainings t
    JOIN training_attendance a ON t.training_id = a.training_id
ORDER BY
    t.training_name,
    a.attendance_date;

-- 2. トレーニングプログラム削除後の出席データ確認クエリ
-- トレーニングプログラム "Cloud Infrastructure" を削除
DELETE FROM trainings
WHERE
    training_name = 'Cloud Infrastructure';

-- 残っている出席データを確認
SELECT
    *
FROM
    training_attendance;
