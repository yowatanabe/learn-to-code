-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS employees;

CREATE TABLE
    IF NOT EXISTS employees (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        position VARCHAR(100) NOT NULL,
        salary DECIMAL(10, 2) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    employees (name, position, salary)
VALUES
    ('従業員A', 'ソフトウェアエンジニア', 6500000),
    ('従業員B', 'プロジェクトマネージャー', 8500000),
    ('従業員C', 'データアナリスト', 5500000),
    ('従業員D', 'デザイナー', 4600000),
    ('従業員E', 'システム管理者', 7000000),
    ('従業員F', 'HRマネージャー', 8000000),
    ('従業員G', 'マーケティングスペシャリスト', 4800000),
    ('従業員H', '営業マネージャー', 9200000),
    ('従業員I', 'システムエンジニア', 7500000),
    ('従業員J', 'カスタマーサポート', 4000000);
