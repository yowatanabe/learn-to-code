-- 1. 各スキルを保有している社員の人数を集計するクエリ
SELECT
  s.skill_name,
  COUNT(es.employee_skill_id) AS total_employees
FROM
  skills s
  LEFT JOIN employee_skills es ON s.skill_id = es.skill_id
GROUP BY
  s.skill_id
ORDER BY
  total_employees DESC;

-- 2. 存在しない `skill_id` を登録した場合のエラーと外部キー制約の役割
INSERT INTO
  employee_skills (employee_id, skill_id, proficiency_level)
VALUES
  (1, 999, 'Beginner');

/*
エラー内容:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`your_database`.`employee_skills`, CONSTRAINT `employee_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`))

外部キー制約の役割:
外部キー制約は、`employee_skills` テーブルの `skill_id` が常に `skills` テーブル内の有効な `skill_id` に一致することを保証します。
この制約により、存在しないスキルを社員スキルとして登録することを防ぎます。
データベース全体の整合性を保ち、誤ったデータの挿入や削除を防ぎます。
 */
