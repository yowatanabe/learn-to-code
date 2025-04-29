package main

import (
	"fmt"
)

func productOfArray(nums []int) int {
    product := 1
    for _, num := range nums {
        product *= num
    }
    return product
}

func main() {
    fmt.Println(productOfArray([]int{1, 2, 3, 4})) // 24
    fmt.Println(productOfArray([]int{2, 5, 6}))    // 60
    fmt.Println(productOfArray([]int{10}))         // 10
}
