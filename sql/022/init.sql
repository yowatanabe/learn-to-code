-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS members_activities;

CREATE TABLE
    IF NOT EXISTS members_activities (
        activity_id INT AUTO_INCREMENT PRIMARY KEY,
        member_id INT NOT NULL,
        activity_name VARCHAR(255) NOT NULL,
        age INT NOT NULL,
        participation_date DATE NOT NULL
    );

-- INSERT DATA
INSERT INTO
    members_activities (member_id, activity_name, age, participation_date)
VALUES
    (1, 'Yoga', 29, '2024-05-10'),
    (2, 'Swimming', 40, '2024-05-10'),
    (1, 'Yoga', 35, '2024-05-11'),
    (3, 'Gymnastics', 45, '2024-05-10'),
    (4, 'Gymnastics', 47, '2024-05-10'),
    (2, 'Swimming', 50, '2024-05-11'),
    (1, 'Yoga', 38, '2024-05-12'),
    (5, 'Tennis', 19, '2024-05-10'),
    (6, 'Tennis', 31, '2024-05-10'),
    (5, 'Tennis', 32, '2024-05-11');
