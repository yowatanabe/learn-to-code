-- 各コースで最も進捗率の高い受講生を取得するクエリ
SELECT
    c.course_name,
    c.instructor,
    p.student_name,
    p.progress_percentage,
    p.last_updated
FROM
    course_progress p
    JOIN courses c ON p.course_id = c.course_id
WHERE
    p.progress_percentage = (
        SELECT
            MAX(progress_percentage)
        FROM
            course_progress p2
        WHERE
            p2.course_id = p.course_id
    )
ORDER BY
    c.course_name;
