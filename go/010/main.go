package main

import "fmt"

func main() {
	numbers := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

	oddNumbers := extractOdd(numbers)
	fmt.Println("奇数:", oddNumbers)
}

func extractOdd(numbers []int) []int {
	var oddNumbers []int

	for _, num := range numbers {
		if num%2 != 0 {
			oddNumbers = append(oddNumbers, num)
		}
	}
	return oddNumbers
}
