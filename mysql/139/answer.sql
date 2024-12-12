-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE update_project_progress(IN project_id_param INT)
BEGIN
    -- 1. 変数を宣言
    DECLARE total_tasks INT;
    DECLARE completed_tasks INT;
    DECLARE progress_rate DECIMAL(5, 2);

    -- 2. 該当プロジェクトのタスク数と完了済みのタスク数を集計
    SELECT COUNT(*) INTO total_tasks
    FROM tasks
    WHERE project_id = project_id_param;

    SELECT COUNT(*) INTO completed_tasks
    FROM tasks
    WHERE project_id = project_id_param AND status = 'Completed';

    -- 3. 進捗率の計算（分母が0にならないように条件を追加）
    IF total_tasks > 0 THEN
        SET progress_rate = (completed_tasks / total_tasks) * 100;
    ELSE
        SET progress_rate = 0;
    END IF;

    -- 4. project_status テーブルの進捗情報を更新
    UPDATE project_status
    SET total_tasks = total_tasks,
        completed_tasks = completed_tasks,
        progress_rate = progress_rate
    WHERE project_id = project_id_param;
END;
//

DELIMITER ;


-- トリガーの作成
DELIMITER //

CREATE TRIGGER after_task_update
AFTER UPDATE ON tasks
FOR EACH ROW
BEGIN
    -- ストアドプロシージャを呼び出して進捗情報を更新
    CALL update_project_progress(NEW.project_id);
END;
//

DELIMITER ;


-- 動作確認データ

-- ケース1: タスクの進捗状況が「Completed」に変更された場合
UPDATE tasks
SET status = 'Completed'
WHERE task_id = 2;

SELECT * FROM project_status;


-- ケース2: 並行トランザクションのテスト
-- セッション1
UPDATE tasks
SET status = 'Completed'
WHERE task_id = 3;

-- セッション2
UPDATE tasks
SET status = 'Completed'
WHERE task_id = 5;

-- プロジェクトの進捗情報を確認
SELECT * FROM project_status;
