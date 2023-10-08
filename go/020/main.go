package main

import "fmt"

type Employee struct {
	Name     string
	Position string
	Manager  string
}

var employees = make(map[string]Employee)

// 従業員を追加
func AddEmployee(name, position, manager string) {
	employee := Employee{
		Name:     name,
		Position: position,
		Manager:  manager,
	}
	employees[name] = employee
}

// 再帰関数
func findSubordinates(name string, subordinates []string) []string {
	for _, employee := range employees {
		if employee.Manager == name {
			subordinates = append(subordinates, employee.Name)
			subordinates = findSubordinates(employee.Name, subordinates)
		}
	}
	return subordinates
}

// 特定の従業員の直属の部下を検索
func FindSubordinates(name string) []string {
	var subordinates []string
	return findSubordinates(name, subordinates)
}

func main() {
	AddEmployee("User1", "Manager", "")
	AddEmployee("User2", "Developer", "User1")
	AddEmployee("User3", "Developer", "User1")
	AddEmployee("User4", "Designer", "User1")

	fmt.Println("User1's Subordinates:")
	user1Subordinates := FindSubordinates("User1")
	for _, subordinate := range user1Subordinates {
		fmt.Println(subordinate)
	}
}
