-- インデックス最適化
-- 患者の退院日 (`DischargeDate`) や科 (`Department`) に基づく検索が頻繁に行われるため、それぞれの列にインデックスを作成します。さらに、複合インデックスを利用することで、クエリのパフォーマンスを向上させます。

-- シングルインデックスの作成
-- `DischargeDate` 列にインデックスを作成することで、退院日を使用したクエリを最適化します。
CREATE INDEX idx_discharge_date ON Patients (DischargeDate);

-- 複合インデックスの作成
-- `Department`と`DischargeDate`の複合インデックスを作成して、科ごとの退院日検索のパフォーマンスを向上させます。
CREATE INDEX idx_department_discharge ON Patients (Department, DischargeDate);

-- インデックスを使用したクエリ
-- 特定の科の退院患者を検索するクエリ
SELECT
  PatientName,
  AdmissionDate,
  DischargeDate
FROM
  Patients
WHERE
  Department = 'Cardiology'
  AND DischargeDate BETWEEN '2024-09-01' AND '2024-09-10';

-- 複合インデックスの利点
-- 複数条件でのクエリ最適化: 複合インデックスを使うことで、`Department`と`DischargeDate`の両方を使用した検索が高速化されます。
-- 範囲検索と等価検索の組み合わせ: インデックスの順序を最適化することで、範囲検索 (`DischargeDate`) と等価検索 (`Department`) を効率的に処理できます。

-- インデックスの確認
SHOW INDEX
FROM
  Patients;
