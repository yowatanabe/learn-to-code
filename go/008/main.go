package main

import "fmt"

func main() {
	numbers := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

	evenNumbers := filterEven(numbers)

	fmt.Println("元のスライス:", numbers)
	fmt.Println("偶数の数のみを含む新しいスライス:", evenNumbers)
}

func filterEven(numbers []int) []int {
	var evenNumbers []int
	for _, num := range numbers {
		if num%2 == 0 {
			evenNumbers = append(evenNumbers, num)
		}
	}
	return evenNumbers
}
