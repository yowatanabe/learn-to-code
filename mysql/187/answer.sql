-- 1. 設備ごとの利用履歴を取得するクエリ
SELECT
    a.asset_name,
    a.asset_type,
    u.employee_name,
    u.usage_start,
    u.usage_end
FROM
    assets a
    JOIN asset_usage u ON a.asset_id = u.asset_id
ORDER BY
    a.asset_name,
    u.usage_start;

-- 2. 設備削除後の利用履歴確認クエリ
-- 設備 "Projector X" を削除
DELETE FROM assets
WHERE
    asset_name = 'Projector X';

-- 残っている利用履歴を確認
SELECT
    *
FROM
    asset_usage;
