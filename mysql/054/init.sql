-- データベースの作成
DROP DATABASE IF EXISTS learn_to_code;

CREATE DATABASE learn_to_code;

-- データベースの選択
USE learn_to_code;

-- テーブルの作成
CREATE TABLE
  Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    AdmissionDate DATE,
    DischargeDate DATE,
    Department VARCHAR(100)
  );

-- 初期データ挿入
INSERT INTO
  Patients (
    PatientID,
    PatientName,
    AdmissionDate,
    DischargeDate,
    Department
  )
VALUES
  (
    1,
    'Alice',
    '2024-09-01',
    '2024-09-10',
    'Cardiology'
  ),
  (
    2,
    'Bob',
    '2024-09-02',
    '2024-09-11',
    'Orthopedics'
  ),
  (
    3,
    'Charlie',
    '2024-09-03',
    '2024-09-12',
    'Neurology'
  ),
  (
    4,
    'David',
    '2024-09-04',
    '2024-09-13',
    'Cardiology'
  ),
  (
    5,
    'Eve',
    '2024-09-05',
    '2024-09-14',
    'Orthopedics'
  );
