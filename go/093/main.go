package main

import (
	"fmt"
	"math/rand"
	"time"
)

func generateRandomSlice(length int) []int {
	slice := make([]int, length)
	for i := 0; i < length; i++ {
		slice[i] = rand.Intn(101)
	}
	return slice
}

func findMaxAndMin(slice []int) (int, int) {
	if len(slice) == 0 {
		return 0, 0
	}

	max, min := slice[0], slice[0]

	for _, num := range slice {
		if num > max {
			max = num
		}
		if num < min {
			min = num
		}
	}
	return max, min
}

func main() {
	length := 10

	rand.Seed(time.Now().UnixNano())
	randomSlice := generateRandomSlice(length)
	fmt.Println("ランダムな整数のスライス:", randomSlice)

	max, min := findMaxAndMin(randomSlice)
	fmt.Printf("最大値: %d, 最小値: %d\n", max, min)
}
