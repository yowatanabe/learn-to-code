-- 1. コースごとの登録者一覧を取得するクエリ
SELECT
    c.course_name,
    c.instructor,
    r.student_name,
    r.registration_date
FROM
    courses c
    JOIN course_registrations r ON c.course_id = r.course_id
ORDER BY
    c.course_name,
    r.registration_date;

-- 2. コース削除後の登録情報確認クエリ
-- コース "Data Science" を削除
DELETE FROM courses
WHERE
    course_name = 'Data Science';

-- 残っている登録情報を確認
SELECT
    *
FROM
    course_registrations;
