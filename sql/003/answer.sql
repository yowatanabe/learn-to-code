SELECT
  name,
  position,
  salary
FROM
  employees
WHERE
  salary > (
    SELECT
      AVG(salary)
    FROM
      employees
  );
