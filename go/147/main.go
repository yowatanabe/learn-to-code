package main

import (
	"fmt"
)

func average(nums []int) float64 {
    if len(nums) == 0 {
        return 0.0
    }
    sum := 0
    for _, num := range nums {
        sum += num
    }
    return float64(sum) / float64(len(nums))
}

func main() {
    fmt.Println(average([]int{1, 2, 3, 4, 5})) // 3.0
    fmt.Println(average([]int{10, 20, 30}))   // 20.0
    fmt.Println(average([]int{7}))            // 7.0
}
