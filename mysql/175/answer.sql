-- 1. 最も多くの受講者が登録しているコースの情報を取得するクエリ
SELECT
    c.course_id,
    c.course_name,
    c.instructor_name,
    subquery.student_count
FROM
    (
        SELECT
            course_id,
            COUNT(*) AS student_count
        FROM
            enrollments
        GROUP BY
            course_id
    ) AS subquery
    JOIN courses c ON c.course_id = subquery.course_id
WHERE
    subquery.student_count = (
        SELECT
            MAX(student_count)
        FROM
            (
                SELECT
                    course_id,
                    COUNT(*) AS student_count
                FROM
                    enrollments
                GROUP BY
                    course_id
            ) AS inner_subquery
    );
