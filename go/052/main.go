package main

import "fmt"

type Department struct {
	Name  string
	Count int
}

func showDepartments(deps []Department) {
	total := 0

	for _, dep := range deps {
		fmt.Println(dep.Name, ":", dep.Count)
		total += dep.Count
	}

	avg := float64(total) / float64(len(deps))
	fmt.Println("平均部員数:", avg)
}

func main() {
	deps := []Department{
		{"営業部", 5},
		{"エンジニア部", 10},
		{"企画部", 3},
	}

	showDepartments(deps)
}
