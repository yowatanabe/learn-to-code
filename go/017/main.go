package main

import "fmt"

type Employee struct {
	Name       string
	ID         int
	Department string
	Salary     int
}

var employeeDB = make(map[int]Employee)

func AddEmployee(name string, id int, department string, salary int) {
	employee := Employee{
		Name:       name,
		ID:         id,
		Department: department,
		Salary:     salary,
	}
	employeeDB[id] = employee
}

func UpdateSalary(id int, newSalary int) {
	if emp, ok := employeeDB[id]; ok {
		emp.Salary = newSalary
		employeeDB[id] = emp
	}
}

func DeleteEmployee(id int) {
	delete(employeeDB, id)
}

func GetEmployeeInfo(id int) Employee {
	return employeeDB[id]
}

func GetAllEmployees() []Employee {
	var employees []Employee
	for _, emp := range employeeDB {
		employees = append(employees, emp)
	}
	return employees
}

func main() {
	AddEmployee("User1", 101, "HR", 50000)
	AddEmployee("User2", 102, "Finance", 60000)
	AddEmployee("User3", 103, "Engineering", 75000)

	UpdateSalary(102, 62000)

	employee := GetEmployeeInfo(101)
	fmt.Println("Employee Information:")
	fmt.Printf("Name: %s\n", employee.Name)
	fmt.Printf("ID: %d\n", employee.ID)
	fmt.Printf("Department: %s\n", employee.Department)
	fmt.Printf("Salary: %d\n", employee.Salary)

	allEmployees_1 := GetAllEmployees()
	fmt.Println("\nAll Employees:")
	for _, emp := range allEmployees_1 {
		fmt.Printf("Name: %s, ID: %d, Department: %s, Salary: %d\n", emp.Name, emp.ID, emp.Department, emp.Salary)
	}

	DeleteEmployee(103)

	allEmployees_2 := GetAllEmployees()
	fmt.Println("\nAll Employees:")
	for _, emp := range allEmployees_2 {
		fmt.Printf("Name: %s, ID: %d, Department: %s, Salary: %d\n", emp.Name, emp.ID, emp.Department, emp.Salary)
	}

}
