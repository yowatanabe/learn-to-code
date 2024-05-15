-- 1. INNER JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  students.studentid,
  students.studentname,
  classes.classname
FROM
  students
  INNER JOIN classes ON students.classid = classes.classid;

-- 2. LEFT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  students.studentid,
  students.studentname,
  classes.classname
FROM
  students
  LEFT JOIN classes ON students.classid = classes.classid;

-- 3. RIGHT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  students.studentid,
  students.studentname,
  classes.classname
FROM
  students
  RIGHT JOIN classes ON students.classid = classes.classid;

-- 4. FULL JOIN を使用して、ProductsテーブルとSuppliersテーブルを結合した結果。
SELECT
  students.studentid,
  students.studentname,
  classes.classname
FROM
  students
  LEFT JOIN classes ON students.classid = classes.classid
UNION
SELECT
  students.studentid,
  students.studentname,
  classes.classname
FROM
  students
  RIGHT JOIN classes ON students.classid = classes.classid;
