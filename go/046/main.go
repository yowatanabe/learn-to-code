package main

import "fmt"

func countEven(nums []int) int {
	count := 0
	for _, num := range nums {
		if num%2 == 0 {
			count++
		}
	}
	return count
}

func main() {
	numbers := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	result := countEven(numbers)
	fmt.Printf("与えられたスライスに含まれる偶数の数は%d個です。\n", result)
}
