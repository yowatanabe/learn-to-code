# No.014

あなたは医療施設のデータベース管理者であり、`appointments` テーブルから糖尿病を持つ患者の予約リストを取得する必要があります。データは、患者のID、名前、予約日、および診断を含む必要があります。

#### `appointments` テーブル:

- `appointment_id` (INT): 予約ID
- `patient_id` (INT): 患者ID
- `patient_name` (VARCHAR): 患者の名前
- `appointment_date` (DATE): 予約日
- `diagnosis` (VARCHAR): 患者の診断情報

#### 要件:

1. `diagnosis` が「Diabetes」である患者の予約情報をフィルタリングします。
2. 結果セットには患者のID、名前、予約日が含まれる必要があります。
