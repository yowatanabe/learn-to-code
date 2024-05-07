-- CREATE DATABASE
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

USE learn_to_code;

-- CREATE TABLE
DROP TABLE IF EXISTS transport_usage;

CREATE TABLE
    IF NOT EXISTS transport_usage (
        usage_id INT AUTO_INCREMENT PRIMARY KEY,
        line_name VARCHAR(255) NOT NULL,
        vehicle_type VARCHAR(50) NOT NULL,
        passenger_count INT NOT NULL
    );

-- INSERT DATA
INSERT INTO
    transport_usage (line_name, vehicle_type, passenger_count)
VALUES
    ('North Line', 'Bus', 120),
    ('South Line', 'Bus', 150),
    ('East Line', 'Tram', 80),
    ('West Line', 'Tram', 200),
    ('Central Line', 'Bus', 170),
    ('Circle Line', 'Tram', 90),
    ('North Line', 'Bus', 110),
    ('South Line', 'Bus', 130);
