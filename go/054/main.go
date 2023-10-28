package main

import "fmt"

func filter(data []int, x int) []int {
	var result []int

	for _, v := range data {
		if v < x {
			result = append(result, v)
		}
	}
	return result
}

func main() {
	data := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

	fmt.Println(filter(data, 5))
}
