-- 回答1のクエリ
SELECT
    e.EmployeeName,
    d.DepartmentName,
    s.Salary,
    s.PaymentDate
FROM
    Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    JOIN Salaries s ON e.EmployeeID = s.EmployeeID;

-- 回答2のクエリ
SELECT
    d.DepartmentName,
    SUM(s.Salary) AS TotalSalary
FROM
    Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    JOIN Salaries s ON e.EmployeeID = s.EmployeeID
GROUP BY
    d.DepartmentName;
