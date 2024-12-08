-- トリガーの作成
-- 新しい勤怠情報が挿入された際に、該当の従業員の勤務時間を自動的に更新するトリガーを作成
DELIMITER //

CREATE TRIGGER after_attendance_insert
AFTER INSERT ON attendance
FOR EACH ROW
BEGIN
    -- 勤務時間の計算 (終了時間 - 開始時間)
    DECLARE work_hours DECIMAL(10, 2);
    SET work_hours = TIME_TO_SEC(TIMEDIFF(NEW.work_end, NEW.work_start)) / 3600; -- 秒を時間に変換

    -- 該当の従業員の月ごとの勤務時間を更新
    UPDATE monthly_work_summary
    SET total_work_hours = total_work_hours + work_hours
    WHERE employee_id = NEW.employee_id
      AND work_year = YEAR(NEW.work_date)
      AND work_month = MONTH(NEW.work_date);

    -- もし該当の行が存在しない場合は、新規に追加する
    IF ROW_COUNT() = 0 THEN
        INSERT INTO monthly_work_summary (employee_id, work_year, work_month, total_work_hours)
        VALUES (NEW.employee_id, YEAR(NEW.work_date), MONTH(NEW.work_date), work_hours);
    END IF;
END;
//

DELIMITER ;


-- 動作確認データ
-- 新しい勤怠情報の挿入
INSERT INTO attendance (employee_id, work_date, work_start, work_end)
VALUES
(1, '2024-12-02', '09:00:00', '18:00:00'), -- 9時間勤務 (Alice)
(2, '2024-12-02', '10:00:00', '19:00:00'), -- 9時間勤務 (Bob)
(3, '2024-12-02', '08:00:00', '17:00:00'); -- 新しい従業員 (Charlie) 9時間勤務


-- 月ごとの勤務時間を確認
SELECT * FROM monthly_work_summary;
