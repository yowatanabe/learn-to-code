-- トリガーの作成
-- `Salaries`テーブルの給与が更新されるたびに、変更内容を`SalaryChanges`テーブルに記録する。
DELIMITER //

CREATE TRIGGER LogSalaryChange
AFTER UPDATE ON Salaries
FOR EACH ROW
BEGIN
    INSERT INTO SalaryChanges (EmployeeID, OldSalary, NewSalary, ChangeDate)
    VALUES (OLD.EmployeeID, OLD.CurrentSalary, NEW.CurrentSalary, NOW());
END //

DELIMITER ;


-- トリガーの使用
-- 給与を更新する
UPDATE Salaries
SET
    CurrentSalary = 5500
WHERE
    EmployeeID = 1;


-- 給与変更ログを確認する
SELECT
    *
FROM
    SalaryChanges;
