package main

import "fmt"

type Employee struct {
	Name     string
	Age      int
	Position string
}

func countEmployees(employees []Employee) int {
	return len(employees)
}

func main() {
	employees := []Employee{
		{Name: "employee1", Age: 20, Position: "Designer"},
		{Name: "employee2", Age: 30, Position: "Developer"},
		{Name: "employee3", Age: 40, Position: "Manager"},
	}
	fmt.Println("Number of employees:", countEmployees(employees))
}
