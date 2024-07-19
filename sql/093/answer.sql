-- ストアドプロシージャの作成
DELIMITER //

CREATE PROCEDURE AddEmployee(
    IN p_EmployeeName VARCHAR(50),
    IN p_DepartmentID INT,
    IN p_Salary DECIMAL(10, 2)
)
BEGIN
    -- 新しい従業員の追加
    INSERT INTO Employees (EmployeeName, DepartmentID, Salary)
    VALUES (p_EmployeeName, p_DepartmentID, p_Salary);
END //

DELIMITER ;


-- トリガーの作成
DELIMITER //

CREATE TRIGGER UpdateDepartmentSalaryAfterInsert
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    UPDATE Departments
    SET TotalSalary = TotalSalary + NEW.Salary
    WHERE DepartmentID = NEW.DepartmentID;
END //

DELIMITER ;


-- ストアドプロシージャの実行
CALL AddEmployee('Frank', 1, 65000);
