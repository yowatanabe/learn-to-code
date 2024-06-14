-- Q1
ALTER TABLE Employees ADD PRIMARY KEY (EmployeeID);

ALTER TABLE Departments ADD PRIMARY KEY (DepartmentID);

ALTER TABLE Salaries ADD PRIMARY KEY (SalaryID);

-- Q2
ALTER TABLE Employees ADD CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID);

ALTER TABLE Salaries ADD CONSTRAINT fk_employee FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID);

-- Q3
CREATE INDEX idx_payment_date ON Salaries (PaymentDate);
