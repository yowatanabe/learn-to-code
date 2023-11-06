package main

import "fmt"

func sumList(numList []int) int {
	sum := 0

	for _, num := range numList {
		sum += num
	}
	return sum
}

func main() {
	numList := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	totalSum := sumList(numList)
	fmt.Println("リスト内の要素の合計:", totalSum)
}
