-- トリガーの作成
-- このトリガーは、`Attendance`テーブルに出勤情報が追加されるたびに、対応する従業員の出勤日数を更新します。
DELIMITER //

CREATE TRIGGER UpdateDaysPresent
AFTER INSERT ON Attendance
FOR EACH ROW
BEGIN
    UPDATE Employees
    SET DaysPresent = DaysPresent + 1
    WHERE EmployeeID = NEW.EmployeeID;
END //

DELIMITER ;


-- トリガーの使用
-- 新しい出勤情報を追加する
INSERT INTO Attendance (EmployeeID, AttendanceDate)
VALUES (2, '2024-11-02 09:00:00');


-- 従業員の出勤日数を確認する
SELECT * FROM Employees;
