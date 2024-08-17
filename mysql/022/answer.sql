-- 複数の条件を組み合わせたフィルタリング (IT部門で給与が70,000以上のアクティブな従業員を選択)
SELECT
  *
FROM
  Employees
WHERE
  Department = 'IT'
  AND Salary >= 70000
  AND Status = 'Active';

-- 特定の期間内に雇用された従業員をフィルタリング (HireDate が 2020-01-01 から 2021-12-31 の間にある従業員を選択)
SELECT
  *
FROM
  Employees
WHERE
  HireDate BETWEEN '2020-01-01' AND '2021-12-31';

-- ステータスが「Resigned」または「On Leave」の従業員をフィルタリング
SELECT
  *
FROM
  Employees
WHERE
  Status IN ('Resigned', 'On Leave');
