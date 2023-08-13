
/*
クエリが実行される際に必要なデータがインデックスから取得されるようにして実行速度の向上を図る。

1. インデックス設定前
100000 rows in set (0.15 sec)

2. インデックス設定後
100000 rows in set (0.08 sec)
*/


-- order_date 列にインデックスを作成
CREATE INDEX idx_order_date ON orders(order_date);

-- customer_id 列にもカバリングインデックスを作成
CREATE INDEX idx_customer_id ON orders(customer_id, order_date);
