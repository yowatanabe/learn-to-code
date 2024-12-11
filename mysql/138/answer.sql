-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE update_employee_salary(
    IN employee_id_param INT,
    IN payment_amount_param DECIMAL(10, 2)
)
BEGIN
    -- 1. 従業員の現在の支給累積額を更新
    UPDATE employees
    SET total_salary_paid = total_salary_paid + payment_amount_param
    WHERE employee_id = employee_id_param;
END;
//

DELIMITER ;


-- トリガーの作成
DELIMITER //

CREATE TRIGGER after_salary_payment_insert
AFTER INSERT ON salary_payments
FOR EACH ROW
BEGIN
    -- ストアドプロシージャを呼び出して、累積支給額を更新
    CALL update_employee_salary(NEW.employee_id, NEW.payment_amount);
END;
//

DELIMITER ;


-- 動作確認データ

-- 正常な給与支払い Alice (employee_id=1) に 500.00 の給与支払う
INSERT INTO salary_payments (employee_id, payment_amount)
VALUES (1, 500.00);

-- 従業員情報を確認
SELECT * FROM employees;


-- 正常な給与支払い Bob (employee_id=2) に 1000.00 の給与支払う
INSERT INTO salary_payments (employee_id, payment_amount)
VALUES (2, 1000.00);

-- 従業員情報を確認
SELECT * FROM employees;



-- 同時に3人の従業員に給与支払いを行う別々のターミナルで以下のSQLを同時に実行

-- ターミナルA Alice への支払い
INSERT INTO salary_payments (employee_id, payment_amount)
VALUES (1, 100.00);

-- ターミナルB Bob への支払い
INSERT INTO salary_payments (employee_id, payment_amount)
VALUES (2, 200.00);

-- ターミナルC Charlie への支払い
INSERT INTO salary_payments (employee_id, payment_amount)
VALUES (3, 300.00);


-- 従業員情報を確認
SELECT * FROM employees;
