-- 1. INNER JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  products.productid,
  products.productname,
  suppliers.suppliername
FROM
  products
  INNER JOIN suppliers ON products.supplierid = suppliers.supplierid;

-- 2. LEFT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  products.productid,
  products.productname,
  suppliers.suppliername
FROM
  products
  LEFT JOIN suppliers ON products.supplierid = suppliers.supplierid;

-- 3. RIGHT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  products.productid,
  products.productname,
  suppliers.suppliername
FROM
  products
  RIGHT JOIN suppliers ON products.supplierid = suppliers.supplierid;

-- 4. FULL JOIN を使用して、ProductsテーブルとSuppliersテーブルを結合した結果。
SELECT
  products.productid,
  products.productname,
  suppliers.suppliername
FROM
  products
  LEFT JOIN suppliers ON products.supplierid = suppliers.supplierid
UNION
SELECT
  products.productid,
  products.productname,
  suppliers.suppliername
FROM
  products
  RIGHT JOIN suppliers ON products.supplierid = suppliers.supplierid;
