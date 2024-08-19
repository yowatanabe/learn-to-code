-- 給与が70,000以上の従業員を選択
SELECT
  *
FROM
  Employees
WHERE
  Salary >= 70000;

-- IT部門でアクティブな従業員を選択
SELECT
  *
FROM
  Employees
WHERE
  Department = 'IT'
  AND Status = 'Active';

-- 給与が未設定の従業員（Salary が NULL）を選択
SELECT
  *
FROM
  Employees
WHERE
  Salary IS NULL;

-- 従業員名に「a」を含む従業員を選択
SELECT
  *
FROM
  Employees
WHERE
  Name LIKE '%a%';
