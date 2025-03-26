package main

import (
	"fmt"
)

func sumArray(nums []int) int {
    total := 0
    for _, num := range nums {
        total += num
    }
    return total
}

func main() {
    fmt.Println(sumArray([]int{1, 2, 3, 4}))     // 10
    fmt.Println(sumArray([]int{-1, 0, 1}))       // 0
    fmt.Println(sumArray([]int{100}))           // 100
}
