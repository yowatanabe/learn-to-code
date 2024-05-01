SELECT
  patient_id,
  patient_name,
  appointment_date
FROM
  appointments
WHERE
  diagnosis = 'Diabetes';
