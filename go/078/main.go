package main

import "fmt"

type Employee struct {
	ID     int
	Name   string
	Salary int
}

func increaseSalary(emp *Employee, increaseAmount int) {
	emp.Salary += increaseAmount
}

func showEmployeeData(employees map[int]Employee) {
	for _, emp := range employees {
		fmt.Printf("社員ID: %d, 従業員名: %s, 給与: %d\n", emp.ID, emp.Name, emp.Salary)
	}
}

func main() {
	employees := map[int]Employee{
		1: {ID: 1, Name: "従業員A", Salary: 50000},
		2: {ID: 2, Name: "従業員B", Salary: 60000},
		3: {ID: 3, Name: "従業員C", Salary: 55000},
	}

	fmt.Println("従業員データ登録:")
	showEmployeeData(employees)

	// 従業員ID:1の給料を増やす
	if emp, ok := employees[1]; ok {
		increaseSalary(&emp, 5000)
		employees[1] = emp
	}

	fmt.Println("昇給後の給与:")
	showEmployeeData(employees)
}
