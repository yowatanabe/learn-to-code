-- ストアドプロシージャの作成
-- このストアドプロシージャでは、プロジェクトIDを受け取り、そのプロジェクトのタスクの進捗状況を集計します。
DELIMITER //

CREATE PROCEDURE GetProjectProgress(
    IN project_id INT
)
BEGIN
    -- タスクの進捗状況を集計
    SELECT
        p.ProjectName,
        COUNT(t.TaskID) AS TotalTasks,
        AVG(t.Progress) AS AverageProgress
    FROM
        Projects p
    JOIN
        Tasks t ON p.ProjectID = t.ProjectID
    WHERE
        p.ProjectID = project_id
    GROUP BY
        p.ProjectID, p.ProjectName;
END //

DELIMITER ;


-- ストアドプロシージャの使用
-- プロジェクトID `1` の進捗状況を集計:
CALL GetProjectProgress(1);
