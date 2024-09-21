-- 1. 最も給与が高い社員の名前と給与を取得するSQL文
SELECT
  emp_name,
  salary
FROM
  employees
WHERE
  salary = (
    SELECT
      MAX(salary)
    FROM
      employees
  );

-- 2. 会社全体の平均給与を上回る部門名とその平均給与を取得するSQL文
SELECT
  dept_name,
  avg_salary
FROM
  (
    SELECT
      d.dept_id,
      d.dept_name,
      AVG(e.salary) AS avg_salary
    FROM
      departments d
      JOIN employees e ON d.dept_id = e.dept_id
    GROUP BY
      d.dept_id,
      d.dept_name
  ) dept_avg
WHERE
  avg_salary > (
    SELECT
      AVG(salary)
    FROM
      employees
  );

-- 3. 部門内で自分の給与が部門平均以上である社員の情報を取得するSQL文
SELECT
  e.emp_name,
  d.dept_name,
  e.salary
FROM
  employees e
  JOIN departments d ON e.dept_id = d.dept_id
WHERE
  e.salary >= (
    SELECT
      AVG(salary)
    FROM
      employees e2
    WHERE
      e2.dept_id = e.dept_id
  );
