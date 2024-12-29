-- 1. 各プロジェクトに割り当てられた社員の人数を取得するクエリ
SELECT project_name,
       COUNT(employee_id) AS total_employees
FROM project_assignments
GROUP BY project_name
ORDER BY total_employees DESC;

-- 2. 存在しない社員IDを登録した場合のエラーと外部キー制約の役割
INSERT INTO project_assignments (employee_id, project_name, assigned_date)
VALUES (999, 'Project Zeta', CURDATE());

/*
エラー内容:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`your_database`.`project_assignments`, CONSTRAINT `project_assignments_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`))

外部キー制約の役割:
外部キー制約は、`project_assignments` の `employee_id` が必ず `employees` テーブル内の `employee_id` と一致することを保証します。
この制約により、存在しない社員にプロジェクトを割り当てることが防止され、データの整合性を保つことができます。
また、`employees` テーブルの社員が削除されても、その社員のプロジェクト割り当て情報が自動で削除されるように、`ON DELETE CASCADE` オプションを利用することも可能です。
*/
