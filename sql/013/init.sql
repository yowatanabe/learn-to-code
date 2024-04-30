-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS inventory;

CREATE TABLE
    IF NOT EXISTS inventory (
        item_id INT AUTO_INCREMENT PRIMARY KEY,
        item_name VARCHAR(255) NOT NULL,
        quantity INT NOT NULL,
        category VARCHAR(100) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    inventory (item_name, quantity, category)
VALUES
    ('USBケーブル', 3, '電子機器'),
    ('ノート', 10, '文房具'),
    ('ボールペン', 5, '文房具'),
    ('モニター', 2, '電子機器'),
    ('デスクトップPC', 1, '電子機器');
