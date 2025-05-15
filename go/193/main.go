package main

import (
	"fmt"
)

func doubleElements(nums []int) []int {
    result := make([]int, len(nums))
    for i, num := range nums {
        result[i] = num * 2
    }
    return result
}

func main() {
    fmt.Println(doubleElements([]int{1, 2, 3}))    // [2 4 6]
    fmt.Println(doubleElements([]int{-1, 0, 5}))   // [-2 0 10]
    fmt.Println(doubleElements([]int{}))           // []
}
