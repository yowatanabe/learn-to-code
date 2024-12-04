-- 部署ごとの従業員数を確認
SELECT * FROM department_summary;


-- トリガーの作成
DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    UPDATE department_summary
    SET employee_count = employee_count + 1
    WHERE department_id = NEW.department_id;
END;
//

DELIMITER ;


-- 従業員の挿入
INSERT INTO employees (name, department_id) VALUES ('Alice', 1);
INSERT INTO employees (name, department_id) VALUES ('Bob', 2);
INSERT INTO employees (name, department_id) VALUES ('Charlie', 1);


-- 部署ごとの従業員数を確認
SELECT * FROM department_summary;
