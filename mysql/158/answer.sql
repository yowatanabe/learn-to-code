-- 1. 各研修に参加した社員の人数を集計するクエリ
SELECT training_name,
       COUNT(employee_id) AS total_participants
FROM training_records
GROUP BY training_name
ORDER BY total_participants DESC;

-- 2. 存在しない `employee_id` を登録した場合のエラーと外部キーの役割
INSERT INTO training_records (employee_id, training_name, participation_date)
VALUES (999, 'Invalid Training', CURDATE());

/*
エラー内容:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`your_database`.`training_records`, CONSTRAINT `training_records_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))

外部キー制約の役割:

外部キー制約は、`training_records` テーブルの `employee_id` が常に `employees` テーブルの有効な `employee_id` に一致することを保証します。
この制約により、存在しない社員に研修を割り当てることを防ぎます。
データベース全体の整合性を保ち、誤ったデータの挿入や削除を防ぐ役割を果たします。
*/
