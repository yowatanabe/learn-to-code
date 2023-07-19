SELECT FirstName,LastName,Salary FROM Employees WHERE Salary = (SELECT max(Salary) FROM Employees);
