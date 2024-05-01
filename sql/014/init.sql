-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS appointments;

CREATE TABLE
    IF NOT EXISTS appointments (
        appointment_id INT AUTO_INCREMENT PRIMARY KEY,
        patient_id INT NOT NULL,
        patient_name VARCHAR(255) NOT NULL,
        appointment_date DATE NOT NULL,
        diagnosis VARCHAR(100) NOT NULL
    );

-- INSERT DATA
INSERT INTO
    appointments (
        patient_id,
        patient_name,
        appointment_date,
        diagnosis
    )
VALUES
    (1, '患者A', '2024-05-02', 'Diabetes'),
    (2, '患者B', '2024-05-03', 'Cold'),
    (3, '患者C', '2024-05-04', 'Diabetes'),
    (4, '患者D', '2024-05-05', 'Flu');
