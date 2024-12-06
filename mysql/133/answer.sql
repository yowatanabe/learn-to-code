-- トリガーの作成：
-- 新規登録時の履歴記録トリガー
DELIMITER //

CREATE TRIGGER after_member_insert
AFTER INSERT ON members
FOR EACH ROW
BEGIN
    INSERT INTO member_audit (member_id, action, details)
    VALUES (NEW.member_id, 'INSERT', CONCAT('New member added: Name=', NEW.name, ', Email=', NEW.email));
END;
//

DELIMITER ;


-- 更新時の履歴記録トリガー
DELIMITER //

CREATE TRIGGER after_member_update
AFTER UPDATE ON members
FOR EACH ROW
BEGIN
    INSERT INTO member_audit (member_id, action, details)
    VALUES (NEW.member_id, 'UPDATE', CONCAT('Member updated: Name=', NEW.name, ', Email=', NEW.email));
END;
//

DELIMITER ;


-- 動作確認データ
-- 新しい会員の登録
INSERT INTO members (name, email, registration_date) VALUES ('Charlie', 'charlie@example.com', '2024-02-01');

-- 既存会員の情報更新
UPDATE members SET email = 'alice.new@example.com' WHERE member_id = 1;

-- 履歴テーブルの確認
SELECT * FROM member_audit;
