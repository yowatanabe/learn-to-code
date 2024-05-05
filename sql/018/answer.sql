SELECT
  COUNT(*) AS '社員の総数',
  SUM(salary) AS '総給与額',
  AVG(salary) AS '平均給与',
  MAX(salary) AS '最高給与',
  MIN(salary) AS '最低給与'
FROM
  employees;
