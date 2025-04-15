package main

import (
	"fmt"
)

func sumOfEvens(nums []int) int {
    sum := 0
    for _, num := range nums {
        if num%2 == 0 {
            sum += num
        }
    }
    return sum
}

func main() {
    fmt.Println(sumOfEvens([]int{1, 2, 3, 4, 5, 6})) // 12
    fmt.Println(sumOfEvens([]int{1, 3, 5}))          // 0
    fmt.Println(sumOfEvens([]int{2, 4, 8}))          // 14
}
