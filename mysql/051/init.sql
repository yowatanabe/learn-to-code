-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  login_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    login_time DATETIME NOT NULL,
    ip_address VARCHAR(45) NOT NULL,
    device VARCHAR(255)
  );

-- 初期データ挿入
INSERT INTO
  login_history (user_id, login_time, ip_address, device)
VALUES
  (
    1001,
    '2023-01-15 08:23:45',
    '192.168.1.10',
    'Windows PC'
  ),
  (
    1002,
    '2023-02-20 12:34:56',
    '192.168.1.11',
    'MacBook Pro'
  ),
  (
    1001,
    '2023-03-05 09:00:00',
    '192.168.1.12',
    'iPhone'
  ),
  (
    1003,
    '2023-04-18 14:45:30',
    '192.168.1.13',
    'Android Phone'
  ),
  (
    1001,
    '2023-05-22 16:17:25',
    '192.168.1.14',
    'iPad'
  ),
  (
    1002,
    '2023-06-30 20:05:10',
    '192.168.1.15',
    'Windows PC'
  ),
  (
    1001,
    '2023-07-10 07:50:00',
    '192.168.1.16',
    'MacBook Air'
  ),
  (
    1003,
    '2023-08-25 22:15:45',
    '192.168.1.17',
    'Linux PC'
  ),
  (
    1001,
    '2023-09-12 11:30:30',
    '192.168.1.18',
    'iPhone'
  ),
  (
    1002,
    '2023-10-05 13:40:55',
    '192.168.1.19',
    'Android Tablet'
  );
