SELECT
  activity_name,
  COUNT(*) AS participation_count
FROM
  members_activities
WHERE
  age >= 30
  AND age < 50
GROUP BY
  activity_name;
