package main

import (
	"fmt"
)

func isBalancedBinary(s string) bool {
    zeroCount := 0
    oneCount := 0

    for _, ch := range s {
        if ch == '0' {
            zeroCount++
        } else if ch == '1' {
            oneCount++
        }
    }

    return zeroCount == oneCount
}

func main() {
    fmt.Println(isBalancedBinary("0101")) // true
    fmt.Println(isBalancedBinary("1100")) // true
    fmt.Println(isBalancedBinary("1001")) // true
    fmt.Println(isBalancedBinary("1110")) // false
}
