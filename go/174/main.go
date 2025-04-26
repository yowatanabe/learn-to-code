package main

import (
	"fmt"
)

func sumParity(nums []int) string {
    sum := 0
    for _, num := range nums {
        sum += num
    }
    if sum%2 == 0 {
        return "even"
    }
    return "odd"
}

func main() {
    fmt.Println(sumParity([]int{1, 2, 3}))  // "even"
    fmt.Println(sumParity([]int{2, 4, 6}))  // "even"
    fmt.Println(sumParity([]int{1, 1, 1}))  // "odd"
}
