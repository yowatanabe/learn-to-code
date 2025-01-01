-- 1. 各顧客の問い合わせ件数を集計するクエリ
SELECT c.name AS customer_name,
       COUNT(i.inquiry_id) AS total_inquiries
FROM customers c
LEFT JOIN inquiries i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total_inquiries DESC;

-- 2. 存在しない `customer_id` を登録した場合のエラーと外部キーの役割
INSERT INTO inquiries (customer_id, inquiry_date, inquiry_text)
VALUES (999, '2023-12-10', 'Test inquiry for a non-existent customer.');

/*
エラー内容:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`your_database`.`inquiries`, CONSTRAINT `inquiries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`))

外部キー制約の役割:
外部キー制約は、`inquiries` テーブルの `customer_id` が常に `customers` テーブルの有効な `customer_id` に一致することを保証します。
この制約により、存在しない顧客に問い合わせを関連付けることを防ぎます。
データベース全体の整合性を保ち、誤ったデータの挿入や削除を防ぐ役割を果たします。
*/
