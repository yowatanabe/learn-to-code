package main

import (
	"fmt"
)

func allElementsEqual(nums []int) bool {
    if len(nums) == 0 {
        return true // 空配列は全て等しいとみなす
    }

    first := nums[0]
    for _, num := range nums {
        if num != first {
            return false
        }
    }
    return true
}

func main() {
    fmt.Println(allElementsEqual([]int{3, 3, 3, 3})) // true
    fmt.Println(allElementsEqual([]int{1, 2, 1}))    // false
    fmt.Println(allElementsEqual([]int{7}))          // true
}
