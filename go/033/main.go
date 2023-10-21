package main

import "fmt"

type employee struct {
	name string
	age  int
}

func averageAge(employees []employee) float64 {
	totalAge := 0

	for _, e := range employees {
		totalAge += e.age
	}

	return float64(totalAge) / float64(len(employees))
}

func main() {
	emps := []employee{
		{"User1", 20},
		{"User2", 30},
		{"User3", 40},
	}

	fmt.Printf("従業員の平均年齢は%.1f歳です。\n", averageAge(emps))
}
