package main

import (
	"fmt"
)

func averagePositive(nums []int) int {
    sum := 0
    count := 0
    for _, num := range nums {
        if num > 0 {
            sum += num
            count++
        }
    }
    if count == 0 {
        return 0
    }
    return sum / count
}

func main() {
    fmt.Println(averagePositive([]int{1, -2, 3, 4}))  // 2
    fmt.Println(averagePositive([]int{-5, -3, 0}))    // 0
    fmt.Println(averagePositive([]int{10, 20, 30}))   // 20
}
