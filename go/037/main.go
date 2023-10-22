package main

import "fmt"

func contains(data []int, x int) bool {
	for _, v := range data {
		if v == x {
			return true
		}
	}
	return false
}

func main() {
	data := []int{1, 2, 3, 4, 5}

	fmt.Println(contains(data, 1))
	fmt.Println(contains(data, 10))
}
