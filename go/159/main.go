package main

import (
	"fmt"
)

func removeZeros(nums []int) []int {
	result := []int{}
	for _, num := range nums {
		if num != 0 {
			result = append(result, num)
		}
	}
	return result
}

func main() {
	fmt.Println(removeZeros([]int{1, 0, 2, 0, 3, 4})) // [1 2 3 4]
	fmt.Println(removeZeros([]int{0, 0, 0}))          // []
	fmt.Println(removeZeros([]int{5, 6, 0, 7}))       // [5 6 7]
}
