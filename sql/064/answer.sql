-- EmployeesテーブルのHireDate列とDepartmentID列にインデックスを作成する。
-- EmployeesテーブルのHireDate列にインデックスを作成
CREATE INDEX idx_hire_date ON Employees (HireDate);

-- EmployeesテーブルのDepartmentID列にインデックスを作成
CREATE INDEX idx_department_id ON Employees (DepartmentID);
