-- 1. 最適なインデックスの作成
-- クエリのパフォーマンスを最適化するために、`customer_id`、`status`、`order_date`を組み合わせた複合インデックスを作成。
CREATE INDEX idx_customer_status_orderdate ON orders (customer_id, status, order_date DESC);

-- 2. インデックスが性能を向上させる理由
-- - 複合インデックスの活用： 作成したインデックス`idx_customer_status_orderdate`は、`customer_id`、`status`、`order_date`の順に索引を作成します。これにより、クエリの`WHERE`句で指定された`customer_id`と`status`の等価条件、および`ORDER BY`句の`order_date DESC`に対して効率的に検索できます。
-- - 検索範囲の大幅な削減： `customer_id`と`status`の組み合わせでまずデータを絞り込み、その後`order_date`でソートされた状態でデータを取得できるため、追加のソート処理が不要になります。
-- - ディスクI/Oの削減： 必要なデータがインデックス上に存在するため、テーブル全体をスキャンする必要がなくなり、ディスクI/Oが減少します。

-- 3. 日別の総売上クエリを最適化するためのインデックス作成と説明
-- インデックスの作成
CREATE INDEX idx_status_orderdate_amount ON orders (status, order_date, total_amount);

-- 効果的な理由
-- - 条件と集計に対応： `status`が`WHERE`句の条件、`order_date`が`GROUP BY`句、`total_amount`が`SUM`集計関数で使用されています。この順序でインデックスを作成することで、クエリのパフォーマンスが向上します。
-- - カバリングインデックスの利用： インデックスに必要なすべてのカラムが含まれているため、データはインデックスのみから取得でき、テーブルへのアクセスが不要になります。
-- - 効率的なグループ化と集計： インデックス上で`order_date`ごとにデータがソートされているため、グループ化と集計処理が高速化されます。
