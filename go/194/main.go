package main

import (
	"fmt"
)

func moveZeroes(nums []int) []int {
    result := make([]int, len(nums))
    idx := 0
    for _, num := range nums {
        if num != 0 {
            result[idx] = num
            idx++
        }
    }
    return result
}

func main() {
    fmt.Println(moveZeroes([]int{0, 1, 0, 3, 12})) // [1 3 12 0 0]
    fmt.Println(moveZeroes([]int{0, 0, 0}))        // [0 0 0]
    fmt.Println(moveZeroes([]int{1, 2, 3}))        // [1 2 3]
}
