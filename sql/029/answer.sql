-- 1. INNER JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  orders.orderid,
  orders.orderdate,
  customers.customername
FROM
  orders
  INNER JOIN customers ON orders.customerid = customers.customerid;

-- 2. LEFT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  orders.orderid,
  orders.orderdate,
  customers.customername
FROM
  orders
  LEFT JOIN customers ON orders.customerid = customers.customerid;

-- 3. RIGHT JOIN を使用して、EmployeesテーブルとDepartmentsテーブルを結合した結果。
SELECT
  orders.orderid,
  orders.orderdate,
  customers.customername
FROM
  orders
  RIGHT JOIN customers ON orders.customerid = customers.customerid;

-- 4. FULL JOIN を使用して、ProductsテーブルとSuppliersテーブルを結合した結果。
SELECT
  orders.orderid,
  orders.orderdate,
  customers.customername
FROM
  orders
  LEFT JOIN customers ON orders.customerid = customers.customerid
UNION
SELECT
  orders.orderid,
  orders.orderdate,
  customers.customername
FROM
  orders
  RIGHT JOIN customers ON orders.customerid = customers.customerid;
