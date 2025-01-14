-- 1. 平均成績が全学生の平均成績より高い学生を取得するクエリ
SELECT
    s.student_id,
    s.student_name,
    AVG(g.score) AS average_score
FROM
    students s
    JOIN grades g ON s.student_id = g.student_id
GROUP BY
    s.student_id,
    s.student_name
HAVING
    AVG(g.score) > (
        SELECT
            AVG(score)
        FROM
            grades
    );
