-- 1. INNER JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  authors.authorid,
  authors.authorname,
  books.booktitle
FROM
  authors
  INNER JOIN books ON authors.authorid = books.authorid;

-- 2. LEFT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  authors.authorid,
  authors.authorname,
  books.booktitle
FROM
  authors
  LEFT JOIN books ON authors.authorid = books.authorid;

-- 3. RIGHT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  authors.authorid,
  authors.authorname,
  books.booktitle
FROM
  authors
  RIGHT JOIN books ON authors.authorid = books.authorid;

-- 4. FULL JOIN を使用して、ProductsテーブルとSuppliersテーブルを結合した結果。
SELECT
  authors.authorid,
  authors.authorname,
  books.booktitle
FROM
  authors
  LEFT JOIN books ON authors.authorid = books.authorid
UNION
SELECT
  authors.authorid,
  authors.authorname,
  books.booktitle
FROM
  authors
  RIGHT JOIN books ON authors.authorid = books.authorid;
