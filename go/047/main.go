package main

import "fmt"

func multiply(data []int, n int) []int {
	result := make([]int, len(data))

	for i, v := range data {
		result[i] = v * n
	}

	return result
}

func main() {
	data := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

	result := multiply(data, 3)

	fmt.Println(result)
}
