package main

import (
	"fmt"
	"sync"
)

type employee struct {
	Name   string
	Tenure int
}

func averageYears(list []employee) float64 {
	var total float64
	var wg sync.WaitGroup

	for _, e := range list {
		wg.Add(1)

		go func(emp employee) {
			defer wg.Done()
			total += float64(emp.Tenure)
		}(e)
	}

	wg.Wait()

	return total / float64(len(list))
}

func main() {
	emps := []employee{
		{"従業員A", 3},
		{"従業員B", 5},
		{"従業員C", 4},
	}

	avg := averageYears(emps)

	fmt.Println("平均在職期間:", avg)
}
