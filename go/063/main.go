package main

import "fmt"

type Employee struct {
	Name   string
	Salary float64
}

func increaseSalaries(employees []Employee) {
	for i := range employees {
		employees[i].Salary *= 1.1
		if employees[i].Salary > 10000 {
			employees[i].Salary = 10000
		}
	}
}

func main() {
	employees := []Employee{
		{"従業員A", 5000},
		{"従業員B", 8000},
		{"従業員C", 11000},
	}

	increaseSalaries(employees)

	for _, emp := range employees {
		fmt.Printf("名前: %s, 給与: %.2f\n", emp.Name, emp.Salary)
	}
}
