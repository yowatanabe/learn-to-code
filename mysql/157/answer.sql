## **質問**

1. **各講座の受講者数を集計するクエリ**を作成してください。
2. 存在しない `course_id` を `enrollments` に登録しようとした場合、どのようなエラーが発生しますか？外部キー制約がデータの一貫性をどのように守るか説明してください。


-- 1. 各講座の受講者数を集計するクエリ
SELECT c.course_name,
       COUNT(e.enrollment_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id
ORDER BY total_students DESC;

-- 2. 存在しない `course_id` を登録した場合のエラーと外部キーの役割
INSERT INTO enrollments (course_id, student_name, enrollment_date)
VALUES (999, 'Test Student', CURDATE());

/*
エラー内容:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`your_database`.`enrollments`, CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`))

外部キー制約の役割:
外部キー制約は、`enrollments` テーブルの `course_id` が常に `courses` テーブル内の有効な `course_id` に一致することを保証します。
この制約により、存在しない講座IDの受講履歴を登録することを防ぎます。
データベース全体の整合性を保ち、誤ったデータの挿入や削除を防ぐ役割を果たします。
*/
