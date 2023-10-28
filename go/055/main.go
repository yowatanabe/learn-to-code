package main

import (
	"fmt"
)

func factorials(n int) []int {
	result := []int{}

	fact := 1

	for i := 1; i <= n; i++ {
		fact *= i
		result = append(result, fact)
	}

	return result
}

func main() {
    n := 10

    factorials := factorials(n)

    fmt.Println(factorials)
}
