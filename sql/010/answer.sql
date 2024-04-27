SELECT
  user_id,
  first_name,
  last_name
FROM
  users
WHERE
  MONTH (birthdate) = 9;
