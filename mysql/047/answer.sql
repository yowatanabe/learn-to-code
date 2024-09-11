-- B-Treeインデックスの作成
-- B-Treeインデックスは、デフォルトでInnoDBストレージエンジンで使用され、範囲検索やソートが効率的に行われる。ここでは`Salary`列にB-Treeインデックスを作成する。
CREATE INDEX idx_salary ON Employees (Salary);

-- B-Treeインデックスを使ったクエリ
SELECT
  EmployeeName,
  Salary
FROM
  Employees
WHERE
  Salary BETWEEN 60000 AND 80000;

-- ハッシュインデックスの作成
-- ハッシュインデックスは等価検索に特化しているが範囲検索には向いていない。特定の列に対してハッシュインデックスを使用し、等価検索のパフォーマンスを向上させる。
CREATE TABLE
  EmployeesHash (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
  ) ENGINE = MEMORY;

INSERT INTO
  EmployeesHash (EmployeeID, EmployeeName, Department, Salary)
VALUES
  (1, 'Alice', 'Development', 70000),
  (2, 'Bob', 'HR', 60000),
  (3, 'Charlie', 'Development', 80000),
  (4, 'David', 'Marketing', 55000),
  (5, 'Eve', 'HR', 62000);

-- ハッシュインデックスの作成
CREATE INDEX idx_hash_department ON EmployeesHash (Department) USING HASH;

-- ハッシュインデックスを使ったクエリ
SELECT
  EmployeeName,
  Department
FROM
  EmployeesHash
WHERE
  Department = 'HR';
